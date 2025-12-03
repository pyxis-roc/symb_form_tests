import argparse
import csv
import json

    # instr_result = {}  # {basic_block_name: count, ...}
    # symb_result = {}   # {basic_block_name: symb_count_expr, ...}

def parse_bv_value(bv_str):
    """Parse a bit-vector string into an integer."""
    if bv_str.startswith('#b'):
        return int(bv_str[2:], 2)
    elif bv_str.startswith('#x'):
        return int(bv_str[2:], 16)
    else:
        return bv_str

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
            res[name] = basic_graph['count']
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
                "symb_count": symb_result[name],
                "exact_count": None,
                # "difference": None,
                "message": f"Warning: {name} is not in instr results"
            })
            continue

        symb_count = symb_result[name]
        exact_count = instr_result[name]

        if symb_count is None:
            results.append({
                "name": name,
                "status": "missing_symb",
                "symb_count": None,
                "exact_count": exact_count,
                # "difference": None,
                "message": f"Warning: {name} has no symbolic count"
            })
            continue

        if exact_count is None:
            results.append({
                "name": name,
                "status": "missing_exact",
                "symb_count": symb_count,
                "exact_count": None,
                # "difference": None,
                "message": f"Warning: {name} has no exact count"
            })
            continue

        total += 1
        if symb_count == exact_count:
            matched += 1
            results.append({
                "name": name,
                "status": "matched",
                "symb_count": symb_count,
                "exact_count": exact_count,
                # "difference": 0,
                "message": None
            })
        else:
            results.append({
                "name": name,
                "status": "mismatch",
                "symb_count": symb_count,
                "exact_count": exact_count,
                # "difference": symb_count - exact_count,
                "message": None
            })

    summary = {"matched": matched, "total": total}
    return results, summary

def print_compare_results(results, summary):
    for result in results:
        if result["status"] == "missing_instr":
            print(result["message"])
        elif result["status"] == "missing_symb":
            print(result["message"])
        elif result["status"] == "missing_exact":
            print(result["message"])
        elif result["status"] == "matched":
            print(f"Matched: {result['name']} = {result['exact_count']}")
        elif result["status"] == "mismatch":
            print(f"Mismatch: {result['name']} = {result['exact_count']}, symb = {result['symb_count']}")
            # print(f"  Difference: {result['difference']} (symb - exact)")
        print()
    print(f"Matched: {summary['matched']}/{summary['total']}")

def print_summary(summary):
    print(f"  Matched: {summary['matched']}/{summary['total']}")


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