import matplotlib.pyplot as plt
import csv
import numpy as np

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
    plt.show()

# Example usage for "add"
filename = "overhead_results.csv"
# Get all unique op labels from the CSV
with open(filename, "r") as f:
    reader = csv.DictReader(f)
    op_labels = sorted(set(row["label"] for row in reader))

for op_label in op_labels:
    sizes, dynm_init, dynm_exec, symb_init, symb_exec = read_op_data(filename, op_label)
    if not sizes:
        continue  # Skip if no data for this label

    # Average init time over all sizes
    avg_dynm_init = np.mean(dynm_init)
    avg_symb_init = np.mean(symb_init)

    plot_init_time(f'{op_label.capitalize()} Init Time: Dynm vs Symb', ['dynm', 'symb'], [avg_dynm_init, avg_symb_init])
    plot_exec_time(f'{op_label.capitalize()} Execution Time: Dynm vs Symb', sizes, dynm_exec, symb_exec, f'{op_label.capitalize()} Size')
