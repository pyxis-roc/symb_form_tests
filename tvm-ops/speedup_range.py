import csv
import argparse
from collections import defaultdict
from pathlib import Path
from statistics import median

parser = argparse.ArgumentParser()
parser.add_argument(
    "csv_file",
    nargs="?",
    default="./results/overhead_full_with_instance.csv",
    help="CSV file containing overhead experiment results.",
)
parser.add_argument(
    "--output",
    default=None,
    help="Optional text file for the speed-up range summary.",
)
args = parser.parse_args()

# Dictionary to store speed-up ranges for each operator
speedup_ranges = defaultdict(list)

# Read the CSV file and compute speed-up
with open(args.csv_file, mode='r') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        operator = row['label']
        dynm_exec_time = float(row['avg_dynm_exec_ns'])
        symb_exec_time = float(row['avg_inst_exec_ns'])
        speedup = dynm_exec_time / symb_exec_time
        speedup_ranges[operator].append(speedup)

# Operators to exclude
excluded_operators = {'squeeze', 'shape', 'slice'}

# Filter out excluded operators
filtered_speedup_ranges = {
    operator: speedups
    for operator, speedups in speedup_ranges.items()
    if operator not in excluded_operators
}

output_lines = []


def emit(line=""):
    output_lines.append(line)
    print(line)


# Display the speed-up range for each operator (excluding specified operators)
emit("Operator Speed-Up Ranges (excluding squeeze, shape, slice):")
for operator, speedups in filtered_speedup_ranges.items():
    emit(f"{operator}: {min(speedups):.10f}x - {max(speedups):.2f}x")

# Display the range, average minimum, and average maximum speed-up for each operator
emit()
emit("Operator Speed-Up Statistics (excluding squeeze, shape, slice):")
for operator, speedups in filtered_speedup_ranges.items():
    avg_min = sum(speedups) / len(speedups)
    avg_max = max(speedups)
    emit(f"{operator}: Range: {min(speedups):.10f}x - {avg_max:.2f}x, Average Min: {avg_min:.10f}x, Average Max: {avg_max:.10f}x")

# Display the median speed-up for each operator
emit()
emit("Operator Median Speed-Up (excluding squeeze, shape, slice):")
for operator, speedups in filtered_speedup_ranges.items():
    median_speedup = median(speedups)
    emit(f"{operator}: Median Speed-Up: {median_speedup:.10f}x")

# Compute the average speed-up for all operators (excluding specified operators)
all_speedups = [speedup for speedups in filtered_speedup_ranges.values() for speedup in speedups]
average_speedup = sum(all_speedups) / len(all_speedups) if all_speedups else 0

emit()
emit(f"Average Speed-Up (excluding squeeze, shape, slice): {average_speedup:.10f}x")

# Compute the median speed-up across all kernels and all runs (excluding specified operators)
overall_median_speedup = median(all_speedups) if all_speedups else 0

emit()
emit(f"Median Speed-Up (across all kernels and all runs, excluding squeeze, shape, slice): {overall_median_speedup:.10f}x")

if args.output:
    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text("\n".join(output_lines) + "\n")
