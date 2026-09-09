import os
import subprocess
import csv
import re


# These metrics classify unsupported semantic patterns found during benchmark
# validation; they are not structural metrics reported by symb-viewer.
DATA_DEPENDENT_BLOCKS = {
    "prelu": 3,
    "topk": 2,
}
NON_AFFINE_CONDITIONS = {
    "pad": 1,
}

def parse_symb_viewer_output(output):
    """
    Parse the output of symb-viewer into a dictionary.
    """
    result = {}
    for line in output.splitlines():
        match = re.match(r"^(.*?):\s*(\d+)$", line)
        if match:
            key, value = match.groups()
            result[key.strip()] = int(value)
    return result

def process_ll_files(base_dir, output_csv):
    """
    Traverse the base directory, process .ll files, and save sorted results to a CSV.
    """
    results = []
    column_name_map = {
        "Number of Basic Blocks": "BB",
        "Max Loop Depth": "MLD",
        "Phi Nodes": "Phi",
        "Number of symbolic loop counts": "LC",
        "Number of symbolic true ratios": "TR",
        "Number of early exits": "EE",
        "Number of composite symbolic expressions": "CSE"
    }

    for root, _, files in os.walk(base_dir):
        for file in files:
            if file.endswith(".ll"):
                ll_file_path = os.path.join(root, file)
                base_name = os.path.splitext(file)[0]
                try:
                    # Call symb-viewer and capture output
                    process = subprocess.run(
                        ["symb-viewer", "characterize", ll_file_path, f"{base_name}_compute_"],
                        stdout=subprocess.PIPE,
                        stderr=subprocess.PIPE,
                        text=True,
                        check=True
                    )
                    parsed_output = parse_symb_viewer_output(process.stdout)
                    parsed_output['name'] = base_name
                    # Add benchmark classifications used by Table 2.
                    parsed_output['AC'] = 3 if 'conv' in base_name or 'pad' in base_name else 0
                    parsed_output['DD'] = DATA_DEPENDENT_BLOCKS.get(base_name, 0)
                    parsed_output['NAC'] = NON_AFFINE_CONDITIONS.get(base_name, 0)
                    results.append(parsed_output)
                except subprocess.CalledProcessError as e:
                    print(f"Error processing {ll_file_path}: {e.stderr}")

    # Sort results by column values in descending order, ignoring the 'name' column
    if results:
        fieldnames = list(results[0].keys())
        fieldnames.remove('name')
        fieldnames = ['name'] + fieldnames  # Place 'name' as the first column

        results.sort(
            key=lambda x: [float(x[k]) if isinstance(x[k], (int, float)) or x[k].replace('.', '', 1).isdigit() else x[k] for k in fieldnames if k != 'name'],
            reverse=True
        )

        # Rename columns using the column_name_map
        renamed_fieldnames = ['name'] + [
            "BB", "Phi", "TR", "LC", "MLD", "EE", "CSE", "AC", "DD", "NAC"
        ]
        renamed_results = [
            {str(column_name_map.get(k, k)): v for k, v in row.items()} for row in results
        ]

        # Write sorted and renamed results to CSV
        with open(output_csv, mode="w", newline="") as csvfile:
            writer = csv.DictWriter(csvfile, fieldnames=renamed_fieldnames)
            writer.writeheader()
            writer.writerows(renamed_results)

if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Process .ll files and save results to CSV.")
    parser.add_argument("base_dir", help="Base directory to search for .ll files")
    parser.add_argument("--output_csv", default="characterize.csv", help="Output CSV file to save results (default: characterize.csv)")
    args = parser.parse_args()

    process_ll_files(args.base_dir, args.output_csv)
