import matplotlib.pyplot as plt
import csv
import numpy as np
from matplotlib.lines import Line2D
import pandas as pd
from plotnine import ggplot, aes, geom_bar, theme_minimal, labs, scale_fill_manual, theme, element_text

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

def plot_init_time(title, init_labels, init_times):
    x = np.arange(len(init_labels))
    plt.figure(figsize=(3, 4))
    plt.bar(x, init_times, color=['#1f77b4', '#ff7f0e'], width=0.5)
    plt.xticks(x, init_labels)
    plt.ylabel('Init Time (ms)')
    plt.title(title)
    plt.xlim(-0.5, len(init_labels) - 0.5)
    plt.tight_layout()
    # plt.savefig(f"{title.replace(' ', '_').lower()}.png")
    plt.show()

def plot_exec_time(title, sizes, dynm_exec, symb_exec, xlabel):
    plt.figure(figsize=(8, 5))
    plt.plot(sizes, dynm_exec, marker='o', label='Dynm Exec')
    plt.plot(sizes, symb_exec, marker='s', label='Symb Exec')
    plt.xlabel(xlabel)
    plt.yscale('log')
    plt.ylabel('Execution Time (ms)')
    plt.title(title)
    plt.xticks(sizes, [str(size) if size > 128 else '' for size in sizes])
    plt.legend()
    plt.tight_layout()
    # plt.savefig(f"{title.replace(' ', '_').lower()}.png")
    plt.show()

def plot_all_init_times(op_labels, avg_dynm_inits, avg_symb_inits):
    # Prepare the data for plotnine
    data = pd.DataFrame({
        'Operation': [label.capitalize() for label in op_labels] * 2,
        'Avg Time (ms)': avg_dynm_inits + avg_symb_inits,
        'Method': ['PGO'] * len(op_labels) + ['Symbolic'] * len(op_labels)
    })

    # Create the plot
    plot = (
        ggplot(data, aes(x='Operation', y='Avg Time (ms)', fill='Method'))
        + geom_bar(stat='identity', position='dodge', width=0.7)
        + scale_fill_manual(values=['#1f77b4', '#ff7f0e'])
        + labs(
            title='Avg Analysis Time: PGO vs Symbolic (All Ops)',
            x='Operation',
            y='Avg Analysis Time (ms)',
        )
        + theme_minimal()
        + theme(
            axis_text_x=element_text(rotation=30, hjust=1),
            figure_size=(10, 6),
            # Move legend inside the plot
            legend_position=(0.95, 0.9),
            legend_justification='right'
        )
    )

    # Display the plot
    plot.save("all-init.pdf")
    print(plot)

def plot_all_exec_times(op_labels, sizes_list, dynm_exec_list, symb_exec_list):
    plt.figure(figsize=(9, 5))
    # Manually define 14 easy-to-distinguish colors (no light/dark pairs)
    color_set = [
        "#1f77b4",  # Muted Blue
        "#ff7f0e",  # Muted Orange
        "#2ca02c",  # Muted Green
        "#d62728",  # Muted Red
        "#9467bd",  # Muted Purple
        "#8c564b",  # Muted Brown
        "#e377c2",  # Muted Pink
        "#7f7f7f",  # Gray
        "#bcbd22",  # Olive
        "#17becf",  # Cyan
        "#aec7e8",  # Light Blue
        "#ffbb78",  # Light Orange
        "#98df8a",  # Light Green
        "#c5b0d5",  # Light Purple
    ]
    for i, op_label in enumerate(op_labels):
        sizes = sizes_list[i]
        dynm_exec = dynm_exec_list[i]
        symb_exec = symb_exec_list[i]
        base_color = color_set[i % len(color_set)]
        # Dynm: solid line, opaque
        plt.plot(
            sizes, dynm_exec, marker='o', linestyle='-',
            color=base_color, alpha=1.0
        )
        # Symb: dashed line, same color, more transparent
        plt.plot(
            sizes, symb_exec, marker='s', linestyle='--',
            color=base_color, alpha=0.7
        )
        # Add text label at last data point for dynm
        plt.text(
            sizes[-1], dynm_exec[-1],
            f"{op_label.capitalize()} PGO",
            color=base_color, fontsize=11, va='bottom', ha='left', alpha=1.0
        )
        # Add text label at last data point for symb
        plt.text(
            sizes[-1], symb_exec[-1],
            f"{op_label.capitalize()} Symb",
            color=base_color, fontsize=11, va='bottom', ha='left', alpha=1.0
        )
    plt.xlabel('Size')
    plt.yscale('log')
    plt.ylabel('Execution Time (ms)')
    plt.title('Execution Time: Dynm vs Symb (All Ops)')
    plt.tight_layout()
    plt.show()

# Example usage for "add"
filename = "overhead_results.csv"
# Get all unique op labels from the CSV
with open(filename, "r") as f:
    reader = csv.DictReader(f)
    op_labels = sorted(set(row["label"] for row in reader))

# for op_label in op_labels:
#     sizes, dynm_init, dynm_exec, symb_init, symb_exec = read_op_data(filename, op_label)
#     if not sizes:
#         continue  # Skip if no data for this label

#     # Average init time over all sizes
#     avg_dynm_init = np.mean(dynm_init)
#     avg_symb_init = np.mean(symb_init)

#     plot_init_time(f'{op_label.capitalize()} Init Time: Dynm vs Symb', ['dynm', 'symb'], [avg_dynm_init, avg_symb_init])
#     plot_exec_time(f'{op_label.capitalize()} Execution Time: Dynm vs Symb', sizes, dynm_exec, symb_exec, f'{op_label.capitalize()} Size')

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

plot_all_init_times(op_labels, avg_dynm_inits, avg_symb_inits)
plot_all_exec_times(op_labels, sizes_list, dynm_exec_list, symb_exec_list)