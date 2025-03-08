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
    parser.add_argument("--h", type=int, help="Fixed value for h (if not evaluated)", default=5)
    parser.add_argument("--k", type=int, help="Fixed value for k (if not evaluated)", default=10)
    parser.add_argument("--m", type=int, help="Fixed value for m (if not evaluated)", default=60)
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
    pattern = r"(?P<model>.+?)-t-(?P<t>[\d.]+)-h-(?P<h>\d+)-k-(?P<k>\d+)-m-(?P<m>\d+)\.jsonl$"
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


def get_avg_acceptance_lengths(filepath):
    avg_accept_lengths = []
    with open(filepath, 'r') as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            try:
                data = json.loads(line)["choices"][0]
                accept_lengths = data.get("accept_lengths", [])
                # accept lengths should be a list, as there are multiple turns
                merged_accept_lengths = []
                for sublist in accept_lengths:
                    merged_accept_lengths.extend(sublist)

                if merged_accept_lengths:
                    avg_accept_length = sum(merged_accept_lengths) / len(merged_accept_lengths)
                    avg_accept_lengths.append(avg_accept_length)

            except json.JSONDecodeError:
                print(f"Warning: Skipping invalid JSON line in {filepath}")
    return avg_accept_lengths


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
        avg_accept_lengths = get_avg_acceptance_lengths(filepath)
        if not avg_accept_lengths:
            continue

        # Group results by the variable value.
        if var_val not in results:
            results[var_val] = []
        results[var_val].extend(avg_accept_lengths)

    if not results:
        print("No matching results found.")
        return

    # Sort the results by the evaluated variable values.
    sorted_keys = sorted(results.keys())
    data = [results[k] for k in sorted_keys]

    # Create the box plot.
    plt.figure(figsize=(4, 3))
    medianprops = dict(color="black", linewidth=1.5)
    meanprops = dict(color="green", linewidth=1.5)

    bp = plt.boxplot(
        data,
        tick_labels=sorted_keys,
        showmeans=True,
        meanline=True,
        medianprops=medianprops,
        meanprops=meanprops
    )

    plt.plot([], [], '-', linewidth=1.5, color="black", label="median")
    plt.plot([], [], '--', linewidth=1.5, color="green", label="mean")
    plt.legend(loc="best", frameon=False)

    plt.xlabel(eval_var)
    plt.ylabel("Average Acceptance Length")

    fixed_info = ", ".join(f"{var}={val}" for var, val in fixed_filters.items() if var != args.eval_var)
    plt.title(f"{model_name} @ {args.dataset_name}\n({fixed_info})")

    plot_path = os.path.join(dataset_dir, f"{model_name}-{eval_var}.png")
    plt.savefig(plot_path, bbox_inches="tight", dpi=300)


if __name__ == "__main__":
    main()
