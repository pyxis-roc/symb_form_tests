import argparse
import subprocess

def main():
    parser = argparse.ArgumentParser(description="Process IR file and function name.")
    parser.add_argument("ir_file", help="Path to the .ll IR file")
    parser.add_argument("function_name", help="Function name string")
    args = parser.parse_args()

    # Run create_cfg
    create_cfg_cmd = ["create_cfg", args.ir_file]
    subprocess.run(create_cfg_cmd, check=True)

    # Run symb-viewer and capture output
    symb_viewer_cmd = ["symb-viewer", args.ir_file, args.function_name]
    with open("new_results.txt", "w") as outfile:
        subprocess.run(symb_viewer_cmd, stdout=outfile, check=True)

if __name__ == "__main__":
    main()