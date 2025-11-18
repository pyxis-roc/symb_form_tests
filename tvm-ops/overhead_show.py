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

def plot_all_init_times_matplotlib(op_labels, avg_dynm_inits, avg_symb_inits, spec_bb_counts):
    # Prepare data
    data = sorted(
        zip(op_labels, avg_dynm_inits, avg_symb_inits, [spec_bb_counts[label] for label in op_labels]),
        key=lambda x: x[3],  # Sort by basic blocks
        reverse=False
    )
    operations, avg_dynm_inits, avg_symb_inits, basic_blocks = zip(*data)
    operations = [label.capitalize() for label in operations]

    # Create the figure and axis
    fig, ax1 = plt.subplots(figsize=(10, 6))

    # Bar plot for average times
    bar_width = 0.35
    x = np.arange(len(operations))
    ax1.bar(x - bar_width / 2, avg_dynm_inits, bar_width, label='PGO', color='#1f77b4')
    ax1.bar(x + bar_width / 2, avg_symb_inits, bar_width, label='Symbolic', color='#ff7f0e')

    # Customize the first y-axis
    ax1.set_xlabel('Operation')
    ax1.set_ylabel('Avg Analysis Time (ms)', color='black')
    ax1.set_title('Avg Analysis Time: PGO vs Symbolic')
    ax1.set_xticks(x)
    ax1.set_xticklabels(operations, rotation=30, ha='right')
    ax1.legend(loc='upper left')
    ax1.tick_params(axis='y', labelcolor='black')

    # Create the second y-axis for basic blocks
    ax2 = ax1.twinx()
    ax2.plot(x, basic_blocks, color='black', marker='o', markersize=5, label='Basic Blocks')  # Reduced dot size
    ax2.set_ylabel('Basic Blocks', color='black')
    ax2.tick_params(axis='y', labelcolor='black')

    # Add labels for basic blocks
    for i, bb in enumerate(basic_blocks):
        ax2.text(i, bb + 0.5, str(bb), color='black', ha='center', va='bottom', fontsize=8)  # Moved text up

    # Adjust layout and save the plot
    fig.tight_layout()
    plt.savefig("all-init-with-line-matplotlib.pdf")
    plt.show()

# Example usage for "add"
filename = "overhead_results_31.csv"
# Get all unique op labels from the CSV
with open(filename, "r") as f:
    reader = csv.DictReader(f)
    op_labels = sorted(set(row["label"] for row in reader))

with open('characterize.csv', 'r') as f:
    reader = csv.DictReader(f)
    spec_bb_counts = {row['name']: int(row['BB']) for row in reader}

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

plot_all_init_times_matplotlib(op_labels, avg_dynm_inits, avg_symb_inits, spec_bb_counts)