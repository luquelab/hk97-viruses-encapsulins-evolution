# Supporting upstream utilities

These scripts document supporting operations used in the broader project. They are retained for provenance, but they are not the self-contained workflows used to reproduce the compact outputs in `results/`.

| Utility | Purpose | Additional requirements |
|---|---|---|
| `Download_entrez_mcps.py` | Download representative RefSeq major capsid proteins | Network access and an email supplied through `NCBI_EMAIL` |
| `Execute_VIBRANT_in_site.sh` | Run VIBRANT over FASTA inputs | VIBRANT installed and available as `VIBRANT_run.py` |
| `HMMscan_domtblout_to_csv.py` | Convert HMMER `domtblout` output to CSV | Python standard library |
| `Treecluster_wrapper.py` | Run or import TreeCluster results and join metadata | Biopython, pandas, and optionally `TreeCluster.py` |
| `Pull_TreeCLuster_output.R` | Summarize a TreeCluster table with genome metadata | R packages listed at the top of the script; command-line input paths |
| `Pull_VIBRANT_output.py` | Filter and summarize VIBRANT outputs | Biopython, pandas, and helper functions from the broader internal VIBRANT pipeline that are not included here |

The full derived datasets and outputs produced by upstream processing are preserved in the Figshare records linked from the root README. The explicit limitation for `Pull_VIBRANT_output.py` is intentional: it prevents the archive from implying that this legacy orchestration script is independently executable without its original pipeline context.
