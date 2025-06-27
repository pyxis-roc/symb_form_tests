import csv
import json
import re


instr_result = {} # {basic_block_name: count, ...}
symb_result = {} # {basic_block_name: symb_count_expr, ...}


def parse_instr(file_path='instr-results.csv'):
    global instr_result
    with open(file_path, 'r') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            name = row['name']
            count = int(row['count']) if row['count'].isdigit() else None
            instr_result[name] = count


def parse_symb(file_path='eval.json'):
    global symb_result
    with open(file_path, 'r') as jsonfile:
        data = json.load(jsonfile)
        for basic_graph in data['basic_graphs']:
            if basic_graph['graph_type'] == "Loop":
                continue
            name = basic_graph["name"].lstrip('%')
            symb_result[name] = int(basic_graph['guessed_count'])

parse_instr()
parse_symb()

for name in symb_result:
    if name not in instr_result:
        print(f"Warning: {name} is not in instr results")
        continue

    guessed_count = symb_result[name]
    exact_count = instr_result[name]

    if guessed_count is None:
        print(f"Warning: {name} has no guessed count")
        continue

    if exact_count is None:
        print(f"Warning: {name} has no exact count")
        continue
    
    if guessed_count == exact_count:
        print(f"Matched: {name} = {exact_count}")
        matched = matched + 1 if 'matched' in locals() else 1
    else:
        print(f"Mismatch: {name} = {exact_count}, guessed = {guessed_count}")
        print(f"  Difference: {guessed_count - exact_count} (guessed - exact)")

    print()
    total = total + 1 if 'total' in locals() else 1

# Print summary
matched = matched if 'matched' in locals() else 0
total = total if 'total' in locals() else 0
print(f"Matched: {matched}/{total}")