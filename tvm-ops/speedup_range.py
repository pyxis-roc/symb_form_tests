import csv
from collections import defaultdict
from statistics import median

# Filepath for the CSV file
csv_filepath = "/home/jingyu/projects/playground/symb_form_tests/tvm-ops/overhead_results_with_instance.csv"

# Dictionary to store speed-up ranges for each operator
speedup_ranges = defaultdict(list)

# Read the CSV file and compute speed-up
with open(csv_filepath, mode='r') as csvfile:
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

# Display the speed-up range for each operator (excluding specified operators)
print("Operator Speed-Up Ranges (excluding squeeze, shape, slice):")
for operator, speedups in filtered_speedup_ranges.items():
    print(f"{operator}: {min(speedups):.10f}x - {max(speedups):.2f}x")

# Display the range, average minimum, and average maximum speed-up for each operator
print("\nOperator Speed-Up Statistics (excluding squeeze, shape, slice):")
for operator, speedups in filtered_speedup_ranges.items():
    avg_min = sum(speedups) / len(speedups)
    avg_max = max(speedups)
    print(f"{operator}: Range: {min(speedups):.10f}x - {avg_max:.2f}x, Average Min: {avg_min:.10f}x, Average Max: {avg_max:.10f}x")

# Display the median speed-up for each operator
print("\nOperator Median Speed-Up (excluding squeeze, shape, slice):")
for operator, speedups in filtered_speedup_ranges.items():
    median_speedup = median(speedups)
    print(f"{operator}: Median Speed-Up: {median_speedup:.10f}x")

# Compute the average speed-up for all operators (excluding specified operators)
all_speedups = [speedup for speedups in filtered_speedup_ranges.values() for speedup in speedups]
average_speedup = sum(all_speedups) / len(all_speedups) if all_speedups else 0

print(f"\nAverage Speed-Up (excluding squeeze, shape, slice): {average_speedup:.10f}x")

# Compute the median speed-up across all kernels and all runs (excluding specified operators)
overall_median_speedup = median(all_speedups) if all_speedups else 0

print(f"\nMedian Speed-Up (across all kernels and all runs, excluding squeeze, shape, slice): {overall_median_speedup:.10f}x")
