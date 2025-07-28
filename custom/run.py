import os
import subprocess

base_dir = os.path.dirname(os.path.abspath(__file__))

for entry in os.listdir(base_dir):
    dir_path = os.path.join(base_dir, entry)
    if os.path.isdir(dir_path):
        os.chdir(dir_path)
        cc_files = [f for f in os.listdir(dir_path) if f.endswith('.cc')]
        print(f"Checking directory: {dir_path}")
        print(f"Found .cc files: {cc_files}")
        if len(cc_files) == 1:
            cc_file_path = os.path.join(dir_path, cc_files[0])
            show_symb_path = os.path.join(base_dir, 'show_symb.py')
            if os.path.isfile(show_symb_path):
                subprocess.run(['python3', show_symb_path, cc_file_path])