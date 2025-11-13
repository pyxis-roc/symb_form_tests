import matplotlib.pyplot as plt
import csv
import numpy as np
from matplotlib.lines import Line2D
import pandas as pd
from plotnine import ggplot, aes, geom_bar, theme_minimal, labs, scale_fill_manual, theme, element_text, geom_line, scale_y_continuous, geom_text

def read_op_data(filename, op_label):
    sizes = []
    dynm_init = []
    dynm_exec = []
    symb_init = []
    symb_exec = []
    with open(filename, "r") as f:
        reader = csv.DictReader(f)
        for row in reader:
            if row["label"] == op_label:
                sizes.append(int(row["size"]))
                dynm_init.append(float(row["avg_dynm_init_ns"]) / 1e6)
                dynm_exec.append(float(row["avg_dynm_exec_ns"]) / 1e6)
                symb_init.append(float(row["avg_symb_init_ns"]) / 1e6)
                symb_exec.append(float(row["avg_symb_exec_ns"]) / 1e6)
    return sizes, dynm_init, dynm_exec, symb_init, symb_exec


def plot_all_init_times(op_labels, avg_dynm_inits, avg_symb_inits, spec_bb_counts):
    # Prepare the data for plotnine
    data = pd.DataFrame({
        'Operation': [label.capitalize() for label in op_labels] * 2,
        'Avg Time (ms)': avg_dynm_inits + avg_symb_inits,
        'Method': ['PGO'] * len(op_labels) + ['Symbolic'] * len(op_labels),
        'Basic Blocks': [spec_bb_counts[label] for label in op_labels] * 2
    })

    # Sort data by basic block numbers
    data['SortKey'] = data['Basic Blocks']
    data = data.sort_values(by='SortKey', ascending=False)

    # Create the combined plot
    plot = (
        ggplot(data, aes(x='reorder(Operation, SortKey)', y='Avg Time (ms)', fill='Method'))
        + geom_bar(stat='identity', position='dodge', width=0.7)
        + geom_line(
            mapping=aes(x='Operation', y='Basic Blocks', group=1),
            color='black',
            size=1
        )
        + geom_text(
            mapping=aes(x='Operation', y='Basic Blocks', label='Basic Blocks'),
            color='black',
            size=8,
            va='bottom'  # Position text slightly above the line
        )
        + scale_fill_manual(values=['#1f77b4', '#ff7f0e'])
        + labs(
            title='Avg Analysis Time: PGO vs Symbolic (All Ops)',
            x='Operation',
            y='Avg Analysis Time (ms)',
            fill='Method'
        )
        + theme_minimal()
        + theme(
            axis_text_x=element_text(rotation=30, hjust=1),
            figure_size=(10, 6),
            legend_position=(0.95, 0.9),
            legend_justification='right'
        )
        + scale_y_continuous(
            name='Avg Analysis Time (ms)',
        )
    )

    # Save and display the plot
    plot.save("all-init-with-line.pdf")
    print(plot)

# Example usage for "add"
filename = "overhead_results_31.csv"
# Get all unique op labels from the CSV
with open(filename, "r") as f:
    reader = csv.DictReader(f)
    op_labels = sorted(set(row["label"] for row in reader))

with open('spec_basic_block_numbers.csv', 'r') as f:
    reader = csv.DictReader(f)
    spec_bb_counts = {row['name']: int(row['count']) for row in reader}

# Plot all init times together
avg_dynm_inits = []
avg_symb_inits = []
sizes_list = []
dynm_exec_list = []
symb_exec_list = []
for op_label in op_labels:
    sizes, dynm_init, dynm_exec, symb_init, symb_exec = read_op_data(filename, op_label)
    if not sizes:
        continue  # Skip if no data for this label
    avg_dynm_inits.append(np.mean(dynm_init))
    avg_symb_inits.append(np.mean(symb_init))
    sizes_list.append(sizes)
    dynm_exec_list.append(dynm_exec)
    symb_exec_list.append(symb_exec)

plot_all_init_times(op_labels, avg_dynm_inits, avg_symb_inits, spec_bb_counts)