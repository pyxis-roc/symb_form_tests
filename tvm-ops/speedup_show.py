import argparse
from pathlib import Path

import pandas as pd
from plotnine import aes, geom_line, ggplot, labs, theme_minimal
from plotnine.scales import scale_y_log10


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "input_file",
        nargs="?",
        default="./results/overhead_full_with_instance.csv",
        help="CSV file containing the benchmark results.",
    )
    parser.add_argument(
        "--output",
        default="./figures/speedup.pdf",
        help="Path to the output plot file.",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    data = pd.read_csv(args.input_file)

    kernels = ['conv', 'matmul', 'gemm', 'batch_norm']
    filtered_data = data[data['label'].isin(kernels)].copy()
    filtered_data['speedup'] = (
        filtered_data['avg_dynm_exec_ns'] / filtered_data['avg_inst_exec_ns']
    )
    filtered_data['size_numeric'] = pd.to_numeric(filtered_data['size'], errors='coerce')
    filtered_data = filtered_data.dropna(subset=['size_numeric']).sort_values(['label', 'size_numeric'])

    ordered_sizes = (
        filtered_data[['size', 'size_numeric']]
        .drop_duplicates()
        .sort_values('size_numeric')['size']
        .tolist()
    )
    filtered_data['size_tag'] = pd.Categorical(
        filtered_data['size'],
        categories=ordered_sizes,
        ordered=True,
    )

    plot = (
        ggplot(filtered_data, aes(x='size_tag', y='speedup', color='label', group='label')) +
        geom_line() +
        scale_y_log10() +
        labs(
            title='Speedup of Symbolic (compiled) over PGO',
            x='Input Size',
            y='Speedup (Log Scale)'
        ) +
        theme_minimal()
    )

    output_path = Path(args.output)
    plot.save(str(output_path))


if __name__ == '__main__':
    main()