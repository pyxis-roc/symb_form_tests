#!/bin/bash
# filepath: run_symb_viewer.sh

if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory_name>"
    echo "Example: $0 maxpool"
    exit 1
fi

DIR_NAME=$1

# Check if directory exists
if [ ! -d "$DIR_NAME" ]; then
    echo "Error: Directory '$DIR_NAME' not found"
    exit 1
fi

# Enter the directory
cd "$DIR_NAME" || exit 1

echo "Entering directory: $DIR_NAME"
echo "Running symb-viewer..."

# Run symb-viewer and save output to instance.ll
symb-viewer "${DIR_NAME}.ll" "${DIR_NAME}_compute_" --quiet --show-instance > instance.ll

if [ $? -ne 0 ]; then
    echo "Error: symb-viewer failed"
    exit 1
fi

echo "Generated instance.ll"
echo "Compiling with clang++..."

# Compile with clang++
clang++ -O3 instance.ll

if [ $? -eq 0 ]; then
    echo "Compilation successful! Output: a.out"
else
    echo "Compilation failed"
    exit 1
fi