import os
import re
import json
import argparse
import numpy as np
import matplotlib.pyplot as plt
from glob import glob


def parse_args():
    parser = argparse.ArgumentParser(
        description="Analyze ML experiment results by plotting a box plot for a given variable sensitivity."
    )
    parser.add_argument("dataset_name", help="Name of the dataset folder (e.g., mt_bench)")
    parser.add_argument("model_name", help="Model name (e.g., vicuna-70b-fp16)")
    parser.add_argument("eval_var", choices=["h", "k", "m"],
                        help="The hyperparameter to evaluate (one of h, k, m)")
    # Optional fixed values for the other hyperparameters
    parser.add_argument("--h", type=int, help="Fixed value for h (if not evaluated)")
    parser.add_argument("--k", type=int, help="Fixed value for k (if not evaluated)")
    parser.add_argument("--m", type=int, help="Fixed value for m (if not evaluated)")
    # Optionally, you might also want to filter on t if needed:
    parser.add_argument("--t", type=float, default=1.0, help="Value for t (default: 1.0)")
    return parser.parse_args()


def extract_hyperparams(filename):
    """
    Given a filename like:
    ess-vicuna-70b-fp16-t-1.0-h-5-k-10-m-60.jsonl
    Extract and return a dictionary with keys: model, t, h, k, m.
    """
    # Use a regex that captures the model (which may contain hyphens) and the hyperparameter values.
    pattern = r"ess-(?P<model>.+?)-t-(?P<t>[\d.]+)-h-(?P<h>\d+)-k-(?P<k>\d+)-m-(?P<m>\d+)\.jsonl$"
    match = re.search(pattern, filename)
    if not match:
        return None
    params = match.groupdict()
    # Convert the values to proper types.
    params["t"] = float(params["t"])
    params["h"] = int(params["h"])
    params["k"] = int(params["k"])
    params["m"] = int(params["m"])
    return params


def process_file(filepath):
    """
    Process one jsonl file and return a list of average acceptance lengths.
    Each line in the file is a json dict with an "accept_lengths" field.
    """
    averages = []
    with open(filepath, 'r') as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            try:
                data = json.loads(line)
                accept_lengths = data.get("accept_lengths", [])
                if accept_lengths:
                    avg_val = sum(accept_lengths) / len(accept_lengths)
                    averages.append(avg_val)
            except json.JSONDecodeError:
                print(f"Warning: Skipping invalid JSON line in {filepath}")
    return averages


def main():
    args = parse_args()
    dataset_dir = args.dataset_name
    model_name = args.model_name
    eval_var = args.eval_var

    # Build the fixed filter conditions for the other hyperparameters.
    fixed_filters = {}
    for var in ["h", "k", "m"]:
        if var != eval_var:
            value = getattr(args, var)
            if value is not None:
                fixed_filters[var] = value
    # Also include t if needed
    fixed_filters["t"] = args.t

    # Find all jsonl result files under the dataset folder.
    pattern = os.path.join(dataset_dir, "*.jsonl")
    file_list = glob(pattern)
    if not file_list:
        print(f"No jsonl files found in folder {dataset_dir}")
        return

    # Dictionary to group the average values by the evaluated hyperparameter value.
    results = {}

    for filepath in file_list:
        filename = os.path.basename(filepath)
        params = extract_hyperparams(filename)
        if not params:
            print(f"Skipping file with unmatched pattern: {filename}")
            continue

        # Check model match.
        if params["model"] != model_name:
            continue

        # Check fixed filters for hyperparameters other than eval_var.
        skip = False
        for var, fixed_val in fixed_filters.items():
            if var in params and params[var] != fixed_val:
                skip = True
                break
        if skip:
            continue

        # Get the value for the variable under evaluation.
        var_val = params[eval_var]

        # Process file to get average acceptance lengths.
        avg_vals = process_file(filepath)
        if not avg_vals:
            continue

        # Group results by the variable value.
        if var_val not in results:
            results[var_val] = []
        results[var_val].extend(avg_vals)

    if not results:
        print("No matching results found.")
        return

    # Sort the results by the evaluated variable values.
    sorted_keys = sorted(results.keys())
    data = [results[k] for k in sorted_keys]

    # Create the box plot.
    plt.figure(figsize=(8, 6))
    bp = plt.boxplot(data, patch_artist=True, labels=sorted_keys)
    plt.xlabel(eval_var)
    plt.ylabel("Average Acceptance Length")
    plt.title(f"{args.dataset_name}@{model_name}@{eval_var}")

    plt.show()


if __name__ == "__main__":
    main()
