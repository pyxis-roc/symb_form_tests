import argparse
import csv
import json

    # instr_result = {}  # {basic_block_name: count, ...}
    # symb_result = {}   # {basic_block_name: symb_count_expr, ...}

def parse_instr(file_path):
    res = {}
    with open(file_path, 'r') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            name = row['name']
            count = int(row['count']) if row['count'].isdigit() else None
            res[name] = count
    return res

def parse_symb(file_path):
    res = {}
    with open(file_path, 'r') as jsonfile:
        data = json.load(jsonfile)
        for basic_graph in data['basic_graphs']:
            if basic_graph['graph_type'] == "Loop":
                continue
            name = basic_graph["name"].lstrip('%')
            res[name] = int(basic_graph['guessed_count'])
    return res

def compare(instr_result, symb_result):

    matched = 0
    total = 0

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
            matched += 1
        else:
            print(f"Mismatch: {name} = {exact_count}, guessed = {guessed_count}")
            print(f"  Difference: {guessed_count - exact_count} (guessed - exact)")

        print()
        total += 1

    print(f"Matched: {matched}/{total}")

def main():
    parser = argparse.ArgumentParser(description="Compare instruction counts with symbolic results.")
    parser.add_argument('--instr', required=True, help='Path to the instruction CSV file')
    parser.add_argument('--symb', required=True, help='Path to the symbolic JSON file')
    args = parser.parse_args()

    with open(args.instr, 'r') as instr_file:
        instr_result = parse_instr(instr_file)
    with open(args.symb, 'r') as symb_file:
        symb_result = parse_symb(symb_file)
        
    compare(instr_result, symb_result)

if __name__ == "__main__":
    main()