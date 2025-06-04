import os
import subprocess

base_dir = os.path.dirname(os.path.abspath(__file__))

for root, dirs, files in os.walk(base_dir):
    print(f"Entering directory: {root}")
    os.chdir(root)
    for file in files:
        if file.endswith('.ll'):
            ll_path = os.path.join(root, file)
            print(f"Found .ll file: {ll_path}")
            dir_name = os.path.basename(root)
            compute_name = f"{dir_name}_compute_"
            print(f"Generated compute_name: {compute_name}")
            get_results_py = os.path.join(base_dir, 'get_result.py')
            print(f"Looking for get_result.py at: {get_results_py}")
            if os.path.isfile(get_results_py):
                print(f"Found get_result.py, running subprocess...")
                subprocess.run(['python3', get_results_py, ll_path, compute_name])
                print(f"Subprocess finished for {ll_path}")
            else:
                print(f"get_result.py not found in {root}")