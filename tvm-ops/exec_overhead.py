import matplotlib
matplotlib.use("Agg")  # Set a valid backend for matplotlib

from plotnine import *
import polars as pl
from mizani.formatters import scientific_format, custom_format
import math
import pyarrow

theme_set(theme_matplotlib())

DF = pl.read_csv("overhead_results_with_instance.csv")

DF_PLOT = DF.rename({"avg_dynm_exec_ns": "PGO", "avg_inst_exec_ns": "Symbolic"}).unpivot(
    on=["PGO", "Symbolic"], index=["label", "size"]
)
DF_PLOT = DF_PLOT.with_columns(
    (pl.col("value") / 1_000_000).alias("value")
)

PLOT = (
    ggplot(
        data=DF_PLOT, 
        mapping=aes(x="size", y="value")
    )
    + geom_line(mapping=aes(linetype="variable"))
    + guides(linetype=guide_legend(nrow=1))
    + facet_wrap("label", as_table=False)
    + scale_x_continuous(trans="log2", labels=lambda vals: [f"{v:.0f}" for v in vals])
    + scale_y_log10(labels=lambda vals: [rf"$10^{{{int(round(math.log10(v)))}}}$" for v in vals])
    + labs(y="Execution Time (ms)", linetype="Method", shape="Method")
    + theme(
        axis_text_x=element_text(rotation=90, hjust=1),
        figure_size=(9, 5.2),
        legend_position="top",
        legend_direction="horizontal",
    )
)

PLOT.save("all-exec.svg")