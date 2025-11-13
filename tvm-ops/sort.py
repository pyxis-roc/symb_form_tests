import csv

# Read the CSV file
input_file = '/home/jingyu/projects/playground/symb_form_tests/tvm-ops/characterize.csv'
output_file = '/home/jingyu/projects/playground/symb_form_tests/tvm-ops/characterize_sorted.csv'

with open(input_file, 'r') as infile:
    reader = csv.reader(infile)
    header = next(reader)
    
    # Rearrange columns to place 'name' first
    name_index = header.index('name')
    new_order = [name_index] + [i for i in range(len(header)) if i != name_index]
    new_header = [header[i] for i in new_order]
    
    # Read and rearrange rows
    rows = [row for row in reader]
    rearranged_rows = [[row[i] for i in new_order] for row in rows]

# Sort rows by column values in descending order, ignoring the 'name' column
sorted_rows = sorted(
    rearranged_rows,
    key=lambda x: [float(x[i]) if x[i].replace('.', '', 1).isdigit() else x[i] for i in range(1, len(x))],
    reverse=True
)

# Write the sorted data to a new CSV file
with open(output_file, 'w', newline='') as outfile:
    writer = csv.writer(outfile)
    writer.writerow(new_header)
    writer.writerows(sorted_rows)

print(f"Sorted CSV written to {output_file}")
