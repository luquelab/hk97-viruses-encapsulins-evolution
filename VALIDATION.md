# Release validation

Validation was performed on 2026-06-22 in preparation for release `v1.0.0`.

## Environment

- macOS
- Python 3.12.3
- R 4.5.2
- R package versions recorded in `R-packages.txt`

## Results

- All Python files passed byte-code compilation with `python3 -m compileall -q bin`.
- All R files parsed successfully.
- The two Shiny applications loaded successfully without launching a browser.
- The shell utility passed `bash -n` syntax validation.
- `.zenodo.json` parsed as valid JSON and passed repository metadata smoke checks.
- `install_r_dependencies.R` confirmed that all required R packages were installed in the validation environment.
- The statistical workflow completed successfully using the deposited input, random seed 1, 2,000 bootstrap replicates, and 4,999 permutation replicates.
- All nine regenerated statistical CSV files were byte-for-byte identical to their archived counterparts in `results/Statistics_phage_coat_and_encapsulin_fraction/`.

The Tk application was syntax-checked but not launched during automated validation because it requires a graphical display and Python packages not installed in the validation shell. Its required packages are listed in `requirements.txt`.

The upstream utilities described in `bin/utils/README.md` were syntax-checked where possible but were not run against their original external services and pipeline environments.
