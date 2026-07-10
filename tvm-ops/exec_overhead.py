import argparse
from pathlib import Path
import matplotlib
matplotlib.use("Agg")  # Set a valid backend for matplotlib

from plotnine import (
    aes,
    element_text,
    facet_wrap,
    geom_line,
    ggplot,
    guide_legend,
    guides,
    labs,
    scale_linetype_manual,
    scale_x_continuous,
    scale_y_log10,
    theme,
    theme_matplotlib,
    theme_set,
)
import polars as pl
from mizani.formatters import scientific_format, custom_format
import math
import pyarrow

theme_set(theme_matplotlib())

EXCLUDED_LABELS = {
    "constant",
    "scatter",
    "scan",
    "range",
    "loop",
    "cumsum",
    "topk",
}

parser = argparse.ArgumentParser()
parser.add_argument(
    "file",
    nargs="?",
    default="./results/overhead_full_with_instance.csv",
    help="CSV file containing overhead experiment results.",
)
parser.add_argument(
    "--characterize-file",
    default=None,
    help="CSV file containing characterization data. Defaults to characterize.csv next to the input file.",
)
parser.add_argument(
    "--output-base",
    default="./figures/all-exec",
    help="Output path prefix for execution overhead figures.",
)
args = parser.parse_args()

DF = pl.read_csv(args.file)
DF = DF.filter(~pl.col("label").str.to_lowercase().is_in(EXCLUDED_LABELS))

characterize_path = (
    Path(args.characterize_file)
    if args.characterize_file is not None
    else Path(args.file).resolve().with_name("characterize.csv")
)
CHAR_DF = pl.read_csv(characterize_path)

DF_PLOT = DF.rename({"avg_dynm_exec_ns": "PGO", "avg_symb_exec_ns": "Z3", "avg_inst_exec_ns": "compiled"}).unpivot(
    on=["PGO", "Z3", "compiled"], index=["label", "size"]
)
DF_PLOT = DF_PLOT.with_columns(
    (pl.col("value") / 1_000_000).alias("value")
)

FIRST_FIGURE_LABELS = 42


def format_log_ticks(vals):
    return [rf"$10^{{{int(round(math.log10(float(v))))}}}$" for v in vals]


def build_plot(df_plot: pl.DataFrame):
    n_labels = df_plot["label"].n_unique()
    n_cols = math.ceil(math.sqrt(n_labels))
    n_rows = math.ceil(n_labels / n_cols)
    fig_w = n_cols * 3.0
    fig_h = n_rows * 2.6 + 0.6  # +0.6 for legend

    return (
        ggplot(
            data=df_plot,
            mapping=aes(x="size", y="value")
        )
        + geom_line(mapping=aes(linetype="variable"))
        + scale_linetype_manual(
            values={
                "PGO": "solid",
                "compiled": "dashed",
                "Z3": "dashdot",
            }
        )
        + guides(linetype=guide_legend(nrow=1))
        + facet_wrap("label", as_table=False)
        + scale_x_continuous(trans="log2", labels=lambda vals: [f"{v:.0f}" for v in vals])
        + scale_y_log10(labels=format_log_ticks)
        + labs(y="Execution Time (ms)", linetype="Method", shape="Method")
        + theme(
            axis_text_x=element_text(rotation=90, hjust=1),
            figure_size=(9.6, 6.4),
            legend_position="top",
            legend_direction="horizontal",
        )
    )


labels = DF.select("label").unique(maintain_order=True).to_series().to_list()
sorted_labels = (
    CHAR_DF.filter(pl.col("name").is_in(labels))
    .sort(["BB", "name"], descending=[True, False])
    .get_column("name")
    .to_list()
)
sorted_label_set = set(sorted_labels)
missing_labels = [label for label in labels if label not in sorted_label_set]
figure_label_groups = [
    sorted_labels[:FIRST_FIGURE_LABELS],
    sorted_labels[FIRST_FIGURE_LABELS:] + missing_labels,
]
output_base = Path(args.output_base)
output_base.parent.mkdir(parents=True, exist_ok=True)

for index, label_chunk in enumerate(figure_label_groups, start=1):
    if not label_chunk:
        continue

    print(','.join(label_chunk))
    df_chunk = DF_PLOT.filter(pl.col("label").is_in(label_chunk))
    plot = build_plot(df_chunk)

    if index == 1 and not figure_label_groups[1]:
        output_path = output_base.with_suffix(".svg")
    else:
        output_path = Path(f"{output_base}-part{index}.svg")

    plot.save(output_path)
