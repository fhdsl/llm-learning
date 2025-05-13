import pandas as pd

def load_multiple_csv_files(file_paths):
    for file_path in file_paths:
        if file_path.endswith('.csv'):
            try:
                data = pd.read_csv(file_path)
                print(f"Loaded {file_path} with shape {data.shape}")
            except Exception as e:
                print(f"Error loading {file_path}: {e}")
        else:
            print(f"Skipping non-CSV file: {file_path}")