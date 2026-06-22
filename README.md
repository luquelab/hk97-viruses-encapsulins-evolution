# HK97 viruses and encapsulins evolution

Analysis code and compact example data accompanying the accepted Nature Communications article:

> **Small viruses reveal bidirectional evolution between HK97-fold viruses and encapsulins via procapsids**

The publication release of this repository will be archived in Zenodo as version `v1.0.0`. The version-specific Zenodo DOI should be used to cite the exact code associated with the article.

## Scope

This repository contains the self-contained workflows used for the domain co-occurrence network and the Fig. 3 domain-coverage analyses, together with their compact inputs and representative outputs. Full primary and intermediate datasets, protein annotations, sequences, structures, and phylogenetic outputs are deposited separately in Figshare.

| Analysis | Entry point | Input | Representative output |
|---|---|---|---|
| Domain co-occurrence network | `bin/Co_occurrence_domains_network.tkinter.py` | `data/Co_occurrence_domains_network_clan0373_data.csv` | `results/Co_occurrence_domains/` |
| Encapsulin fraction versus genome length | `bin/Hexbin_enc_fraction_vs_genome_length.app.R` | `data/Hexbin_enc_fraction_vs_genome_length_data.csv` | `results/Hexbin_enc_fraction_vs_genome_length/` |
| Phage-coat coverage and encapsulin fraction distributions | `bin/Violin_plots_phage_coat_and_enc_fraction.app.R` | `data/Violin_plots_phage_coat_and_enc_fraction_data.csv` | `results/Violin_plots_phage_coat_and_enc_fraction/` |
| Statistical comparisons among groups | `bin/Statistics_phage_coat_and_encapsulin_fraction.R` | `data/Statistics_phage_coat_and_encapsulin_fraction_data.csv` | `results/Statistics_phage_coat_and_encapsulin_fraction/` |

The scripts in `bin/utils/` document supporting upstream operations. See `bin/utils/README.md` before using them; some require external software or components from the broader analysis environment and are not standalone figure-reproduction workflows.

## Data availability

The complete study datasets are available in three Figshare records:

- Environmental viral genomes and biome metadata: <https://doi.org/10.6084/m9.figshare.30943028>
- Predicted ORFs and protein annotation outputs: <https://doi.org/10.6084/m9.figshare.30948863>
- HK97-fold sequences, structures, and phylogenetic analyses: <https://doi.org/10.6084/m9.figshare.30948881>

`data/DTRs_genomes.fna` contains the environmental viral contigs used by upstream parts of the project. The authoritative deposited copy is Data File S4 in the first Figshare record.

## Requirements

The statistical workflow was validated with R 4.5.2 and the package versions recorded in `R-packages.txt`. Install missing R packages with:

```bash
Rscript install_r_dependencies.R
```

The Python applications require Python 3.10 or later, Tk, and the packages listed in `requirements.txt`:

```bash
python3 -m venv .venv
source .venv/bin/activate
python3 -m pip install -r requirements.txt
```

On Linux, Tk may need to be installed through the operating-system package manager. The upstream utilities may additionally require command-line tools described in `bin/utils/README.md`.

## Run the core analyses

Run commands from the repository root.

### Statistical comparisons

The script writes its CSV outputs to the current working directory. To avoid overwriting the archived representative outputs, use a new directory:

```bash
mkdir -p reproduced_results/statistics
cd reproduced_results/statistics
Rscript ../../bin/Statistics_phage_coat_and_encapsulin_fraction.R \
  ../../data/Statistics_phage_coat_and_encapsulin_fraction_data.csv
```

The random seed, bootstrap replicates, permutation replicates, filtering rules, and post-hoc procedures are defined near the beginning of the script. The primary analysis requires `rstatix`; without it, the script deliberately reports and uses documented fallback procedures that are not identical to the publication analysis.

### Domain co-occurrence network

```bash
python3 bin/Co_occurrence_domains_network.tkinter.py
```

The application opens the deposited binary domain matrix by default. Use the interface to assign domain groups, build the network, evaluate paths, and export SVG files.

### Encapsulin fraction versus genome length

```bash
Rscript -e "shiny::runApp('bin/Hexbin_enc_fraction_vs_genome_length.app.R', launch.browser=TRUE)"
```

Upload `data/Hexbin_enc_fraction_vs_genome_length_data.csv` in the application.

### Phage-coat coverage and encapsulin fraction distributions

```bash
Rscript -e "shiny::runApp('bin/Violin_plots_phage_coat_and_enc_fraction.app.R', launch.browser=TRUE)"
```

The application loads `data/Violin_plots_phage_coat_and_enc_fraction_data.csv` by default when run from the repository.

## Reproducibility notes

- The archived outputs in `results/` are representative analysis outputs rather than the assembled publication figures.
- The Shiny and Tk applications are interactive. Plot export settings are selected through their interfaces.
- The statistical workflow sets random seed 1 and records unrounded pairwise results.
- Complete outputs not suitable for a compact code repository remain preserved in the cited Figshare deposits.
- The `v1.0.0` GitHub release and its version-specific Zenodo DOI identify the code state used for publication.

## Citation

Citation metadata are provided in `CITATION.cff`. After the Zenodo archive is created, cite the version-specific DOI shown on the `v1.0.0` Zenodo record.

## License

The code is released under the MIT License. Data files may be subject to the terms stated in their source repositories and Figshare records.

## Contact

For questions about the repository, contact Antoni Luque at `antoni.luque@miami.edu`.
