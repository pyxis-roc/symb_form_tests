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

def compare_results(instr_result, symb_result):
    results = []
    matched = 0
    total = 0

    for name in symb_result:
        if name not in instr_result:
            results.append({
                "name": name,
                "status": "missing_instr",
                "guessed_count": symb_result[name],
                "exact_count": None,
                "difference": None,
                "message": f"Warning: {name} is not in instr results"
            })
            continue

        guessed_count = symb_result[name]
        exact_count = instr_result[name]

        if guessed_count is None:
            results.append({
                "name": name,
                "status": "missing_guessed",
                "guessed_count": None,
                "exact_count": exact_count,
                "difference": None,
                "message": f"Warning: {name} has no guessed count"
            })
            continue

        if exact_count is None:
            results.append({
                "name": name,
                "status": "missing_exact",
                "guessed_count": guessed_count,
                "exact_count": None,
                "difference": None,
                "message": f"Warning: {name} has no exact count"
            })
            continue

        total += 1
        if guessed_count == exact_count:
            matched += 1
            results.append({
                "name": name,
                "status": "matched",
                "guessed_count": guessed_count,
                "exact_count": exact_count,
                "difference": 0,
                "message": None
            })
        else:
            results.append({
                "name": name,
                "status": "mismatch",
                "guessed_count": guessed_count,
                "exact_count": exact_count,
                "difference": guessed_count - exact_count,
                "message": None
            })

    summary = {"matched": matched, "total": total}
    return results, summary

def print_compare_results(results, summary):
    for result in results:
        if result["status"] == "missing_instr":
            print(result["message"])
        elif result["status"] == "missing_guessed":
            print(result["message"])
        elif result["status"] == "missing_exact":
            print(result["message"])
        elif result["status"] == "matched":
            print(f"Matched: {result['name']} = {result['exact_count']}")
        elif result["status"] == "mismatch":
            print(f"Mismatch: {result['name']} = {result['exact_count']}, guessed = {result['guessed_count']}")
            print(f"  Difference: {result['difference']} (guessed - exact)")
        print()
    print(f"Matched: {summary['matched']}/{summary['total']}")

def print_summary(summary):
    print(f"  Matched: {summary['matched']}")
    print(f"  Total: {summary['total']}")

def main():
    parser = argparse.ArgumentParser(description="Compare instruction counts with symbolic results.")
    parser.add_argument('--instr', required=True, help='Path to the instruction CSV file')
    parser.add_argument('--symb', required=True, help='Path to the symbolic JSON file')
    args = parser.parse_args()

    with open(args.instr, 'r') as instr_file:
        instr_result = parse_instr(instr_file)
    with open(args.symb, 'r') as symb_file:
        symb_result = parse_symb(symb_file)
        
    results, summary = compare_results(instr_result, symb_result)
    print_compare_results(results, summary)

if __name__ == "__main__":
    main()