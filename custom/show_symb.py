import argparse
import subprocess
import os

def main():
    parser = argparse.ArgumentParser(description="Automate clang++ and symb-view commands.")
    parser.add_argument("source", help="C++ source file (e.g., test.cc)")
    args = parser.parse_args()

    src_file = args.source
    if not src_file.endswith('.cc'):
        print("Error: Source file must have .cc extension.")
        return

    ll_file = os.path.splitext(src_file)[0] + ".ll"

    # Run clang++ to generate LLVM IR
    clang_cmd = ["clang++", "-O0", "-S", "-emit-llvm", src_file, "-o", ll_file]
    print("Running:", " ".join(clang_cmd))
    result = subprocess.run(clang_cmd)
    if result.returncode != 0:
        print("clang++ failed.")
        return

    # Run symb-view on the generated .ll file and save output to result.txt
    symb_cmd = ["symb-viewer", ll_file, "main"]
    print("Running:", " ".join(symb_cmd))
    with open("result.txt", "w") as outfile:
        result = subprocess.run(symb_cmd, stdout=outfile)
    if result.returncode != 0:
        print("symb-viewer failed.")

    # Run create_cfg on the generated .ll file
    cfg_cmd = ["create_cfg", ll_file]
    print("Running:", " ".join(cfg_cmd))
    result = subprocess.run(cfg_cmd)
    if result.returncode != 0:
        print("create_cfg failed.")

    # Add more commands as needed below
    # Example: run another tool on the .ll file
    # extra_cmd = ["another-tool", ll_file]
    # print("Running:", " ".join(extra_cmd))
    # result = subprocess.run(extra_cmd)
    # if result.returncode != 0:
    #     print("another-tool failed.")

if __name__ == "__main__":
    main()