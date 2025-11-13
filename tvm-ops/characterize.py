import os
import subprocess
import csv
import re

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
    Traverse the base directory, process .ll files, and save results to a CSV.
    """
    results = []
    for root, _, files in os.walk(base_dir):
        for file in files:
            if file.endswith(".ll"):
                ll_file_path = os.path.join(root, file)
                base_name = os.path.splitext(file)[0]
                try:
                    # Call symb-viewer and capture output
                    process = subprocess.run(
                        ["symb-viewer", ll_file_path, f"{base_name}_compute_", "--char", "--quiet"],
                        stdout=subprocess.PIPE,
                        stderr=subprocess.PIPE,
                        text=True,
                        check=True
                    )
                    parsed_output = parse_symb_viewer_output(process.stdout)
                    parsed_output['name'] = base_name
                    results.append(parsed_output)
                except subprocess.CalledProcessError as e:
                    print(f"Error processing {ll_file_path}: {e.stderr}")

    # Write results to CSV
    if results:
        with open(output_csv, mode="w", newline="") as csvfile:
            writer = csv.DictWriter(csvfile, fieldnames=results[0].keys())
            writer.writeheader()
            writer.writerows(results)

if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Process .ll files and save results to CSV.")
    parser.add_argument("base_dir", help="Base directory to search for .ll files")
    parser.add_argument("--output_csv", default="characterize.csv", help="Output CSV file to save results (default: characterize.csv)")
    args = parser.parse_args()

    process_ll_files(args.base_dir, args.output_csv)
