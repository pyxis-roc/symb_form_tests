"""
audit_kernels.py
----------------
Scans every operator directory under all_ops/, extracts the *_compute_ function
from its LLVM IR file, and classifies it as:

  real     – compute_ owns the core arithmetic (loops/stores/arithmetic ops).
             Calls to alloc/free and min/max/memcpy helpers are allowed.
  wrapper  – compute_ primarily dispatches to another TVM runtime routine:
               • __TVMBackendParallelLaunch  → parallel-lambda dispatch
               • __TVMFFIFunctionCall        → packed FFI call to external fn
  no_ll    – no .ll file found for this operator
  no_fn    – .ll found but no *_compute_ function inside it

Usage:
    python audit_kernels.py [--all_ops_dir PATH]

Output: printed report + tvm-ops/kernel_audit_report.md written to disk.
"""

import os
import re
import argparse
from pathlib import Path

WRAPPER_PATTERNS = [
    "__TVMBackendParallelLaunch",
    "__TVMFFIFunctionCall",
]

def find_ll_file(op_dir: Path) -> Path | None:
    """Return the first .ll file directly inside op_dir (not recursive)."""
    for f in op_dir.iterdir():
        if f.suffix == ".ll" and f.is_file():
            return f
    return None


def extract_compute_body(ll_text: str) -> str | None:
    """
    Find the first function whose name contains '_compute_' (case-sensitive),
    extract from its 'define' line to the matching closing '}', and return
    that block.  Returns None if not found.
    """
    # Find start of compute_ definition
    m = re.search(r"^define\b.*?_compute_\b.*?\{", ll_text, re.MULTILINE)
    if not m:
        return None

    start = m.start()
    # Walk forward counting brace depth to find the matching close
    depth = 0
    i = start
    for i, ch in enumerate(ll_text[start:], start=start):
        if ch == "{":
            depth += 1
        elif ch == "}":
            depth -= 1
            if depth == 0:
                return ll_text[start : i + 1]
    return ll_text[start:]  # fallback: rest of file


def classify(op_dir: Path) -> tuple[str, str]:
    """
    Returns (status, evidence_string).
    """
    ll_file = find_ll_file(op_dir)
    if ll_file is None:
        return "no_ll", "no .ll file found"

    text = ll_file.read_text(errors="replace")
    body = extract_compute_body(text)
    if body is None:
        return "no_fn", f"no *_compute_ function found in {ll_file.name}"

    # Check for wrapper indicators inside the extracted compute_ body
    found_wrappers = [p for p in WRAPPER_PATTERNS if p in body]
    if found_wrappers:
        # Extract the specific call site line(s) for evidence
        evidence_lines = []
        for line in body.splitlines():
            if any(p in line for p in found_wrappers):
                evidence_lines.append(line.strip()[:100])
        evidence = "; ".join(evidence_lines[:3])  # at most 3 lines
        return "wrapper", evidence

    return "real", f"{ll_file.name}"


def main():
    parser = argparse.ArgumentParser(description="Audit TVM LLVM compute_ kernels.")
    parser.add_argument(
        "--all_ops_dir",
        default=str(Path(__file__).parent / "all_ops"),
        help="Path to the all_ops directory",
    )
    args = parser.parse_args()

    all_ops = Path(args.all_ops_dir)
    if not all_ops.is_dir():
        print(f"ERROR: {all_ops} is not a directory")
        return

    results: list[tuple[str, str, str]] = []  # (op_name, status, evidence)

    op_dirs = sorted(d for d in all_ops.iterdir() if d.is_dir())
    for op_dir in op_dirs:
        status, evidence = classify(op_dir)
        results.append((op_dir.name, status, evidence))

    # ── Print to console ──────────────────────────────────────────────────────
    col_op = max(len(r[0]) for r in results) + 2
    col_st = 10
    print(f"\n{'Operator':<{col_op}} {'Status':<{col_st}} Evidence")
    print("─" * (col_op + col_st + 80))
    for op, status, evidence in results:
        print(f"{op:<{col_op}} {status:<{col_st}} {evidence}")

    # ── Summary ───────────────────────────────────────────────────────────────
    counts: dict[str, int] = {}
    for _, s, _ in results:
        counts[s] = counts.get(s, 0) + 1

    print("\n── Summary ──")
    for s, n in sorted(counts.items()):
        print(f"  {s:<12} {n}")
    print(f"  {'TOTAL':<12} {len(results)}")

    wrappers = [(op, ev) for op, st, ev in results if st == "wrapper"]
    if wrappers:
        print("\n── Wrappers (operators where compute_ delegates to TVM runtime) ──")
        for op, ev in wrappers:
            print(f"  {op}: {ev}")

    # ── Write Markdown report ─────────────────────────────────────────────────
    report_path = Path(__file__).parent / "./results/kernel_audit_report.md"
    with report_path.open("w") as f:
        f.write("# LLVM Kernel Audit Report\n\n")
        f.write(
            "For each operator under `all_ops/`, the `*_compute_` function in its "
            "generated LLVM IR was inspected.\n\n"
        )
        f.write("## Classification Criteria\n\n")
        f.write(
            "- **real**: `compute_` owns the core arithmetic loops/stores. "
            "Calls to alloc/free/min/max/memcpy helpers are fine.\n"
        )
        f.write(
            "- **wrapper**: `compute_` primarily dispatches to "
            "`__TVMBackendParallelLaunch` (parallel-lambda) or "
            "`__TVMFFIFunctionCall` (packed FFI) — the core work happens elsewhere.\n"
        )
        f.write(
            "- **no_ll / no_fn**: file/function not found.\n\n"
        )

        f.write("## Per-Operator Results\n\n")
        f.write(f"| Operator | Status | Evidence |\n")
        f.write(f"|---|---|---|\n")
        for op, status, evidence in results:
            # Escape pipes in evidence
            ev_esc = evidence.replace("|", "\\|")
            f.write(f"| `{op}` | {status} | {ev_esc} |\n")

        f.write("\n## Summary\n\n")
        for s, n in sorted(counts.items()):
            f.write(f"- **{s}**: {n}\n")
        f.write(f"- **Total**: {len(results)}\n")

        if wrappers:
            f.write("\n## Wrappers Detail\n\n")
            f.write(
                "The following operators delegate core work to the TVM runtime "
                "and are therefore **not** profiling real computation:\n\n"
            )
            for op, ev in wrappers:
                f.write(f"### `{op}`\n\n```\n{ev}\n```\n\n")

    print(f"\nReport written to: {report_path}")


if __name__ == "__main__":
    main()
