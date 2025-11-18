import csv

def generate_combined_csv(overhead_file, characterize_file, output_file):
    # Read average symbolic execution times from overhead_results_31.csv
    avg_symb_exec_times = {}
    with open(overhead_file, 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            name = row['label']
            avg_symb_exec_ns = float(row['avg_symb_exec_ns'])
            if name not in avg_symb_exec_times:
                avg_symb_exec_times[name] = []
            avg_symb_exec_times[name].append(avg_symb_exec_ns)
    
    # Calculate the average symbolic execution time for each operation
    avg_symb_exec_times = {name: (sum(times) / len(times)) / 1_000_000 for name, times in avg_symb_exec_times.items()}

    # Read basic block counts from characterize.csv
    bb_counts = {}
    with open(characterize_file, 'r') as f:
        reader = csv.DictReader(f)
        for row in reader:
            name = row['name']
            bb_counts[name] = int(row['BB'])

    # Combine data
    combined_data = []
    for name in bb_counts.keys():
        if name in avg_symb_exec_times:
            avg_time = round(avg_symb_exec_times[name], 2)  # Keep two decimal places
            combined_data.append((name, bb_counts[name], avg_time))
    
    # Sort combined data by basic block count in descending order
    combined_data.sort(key=lambda x: x[1], reverse=True)

    # Write sorted data to output CSV
    with open(output_file, 'w', newline='') as f:
        writer = csv.writer(f)
        writer.writerow(['name', 'BB', 'exec'])  # Updated column names
        writer.writerows(combined_data)

# Example usage
generate_combined_csv(
    '/home/jingyu/projects/playground/symb_form_tests/tvm-ops/overhead_results_31.csv',
    '/home/jingyu/projects/playground/symb_form_tests/tvm-ops/characterize.csv',
    '/home/jingyu/projects/playground/symb_form_tests/tvm-ops/combined_results.csv'
)
