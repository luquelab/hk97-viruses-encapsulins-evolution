# Release checklist for v1.0.0

## Before enabling Zenodo

- [ ] Confirm that the accepted article title and repository URL are correct in `README.md`, `CITATION.cff`, and `.zenodo.json`.
- [ ] Confirm that Abelardo Aguilar is the intended software creator; add his ORCID identifier if available.
- [ ] Confirm that Antoni Luque should be listed as a Zenodo contributor with the role `Supervisor`.
- [ ] Confirm that all files intended for public release contain no credentials, confidential data, or unlicensed third-party material.
- [ ] Run the validation commands documented below and review `git diff`.
- [ ] Commit the release-preparation changes and push `main`.

## Connect GitHub and Zenodo

- [ ] Sign in to Zenodo using GitHub.
- [ ] Open the Zenodo GitHub integration page and select **Sync now**.
- [ ] Enable `luquelab/hk97-viruses-encapsulins-evolution`. An owner of the `luquelab` organization may need to approve the Zenodo application.
- [ ] Verify that the repository is shown as enabled before creating the GitHub release.

## Create the archival release

- [ ] On GitHub, create tag `v1.0.0` from the validated release commit.
- [ ] Title the release `Code accompanying Small viruses reveal bidirectional evolution between HK97-fold viruses and encapsulins via procapsids (v1.0.0)`.
- [ ] In the release notes, state that this is the code version associated with the accepted Nature Communications article.
- [ ] Publish the GitHub release.
- [ ] Confirm that Zenodo ingests the release and that its metadata, creators, license, files, and version are correct.
- [ ] Record both the version-specific DOI and the concept DOI. Cite the version-specific DOI in the article.

## Update the manuscript

- [ ] Add the version-specific DOI to the Code Availability statement.
- [ ] Add the software citation to the reference list using the citation exported by Zenodo.
- [ ] Add the version-specific DOI to `CITATION.cff` on the default branch after the archive is minted. This post-release metadata update does not change the archived `v1.0.0` code.
- [ ] Optionally add a Zenodo DOI badge to `README.md` using the concept DOI.

## Local validation commands

```bash
python3 -m compileall -q bin
Rscript -e 'for (f in list.files("bin", pattern="[.]R$", recursive=TRUE, full.names=TRUE)) { parse(file=f); cat("parsed", f, "\n") }'
bash -n bin/utils/Execute_VIBRANT_in_site.sh
Rscript install_r_dependencies.R
```

Run the statistical workflow in a temporary output directory and compare its output tables with the archived files under `results/Statistics_phage_coat_and_encapsulin_fraction/`.
