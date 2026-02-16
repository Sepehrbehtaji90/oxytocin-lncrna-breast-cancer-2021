# oxytocin-lncrna-breast-cancer-2021

Reproducible R pipeline and results artifacts for the 2021 Scientific Reports study on oxytocin-related lncRNAs/genes in breast cancer (GSE54002 + qPCR + correlations + ROC/ML).

## Publication
- Title: Identification of oxytocin-related lncRNAs and assessment of their expression in breast cancer
- Journal: Scientific Reports (2021)
- DOI: 10.1038/s41598-021-86097-2
- PMID: 33742056

## What is included
- GEO microarray analysis: GSE54002 → limma differential expression → DEG lists
- QC figures: boxplot, correlation heatmap, PCA
- Downstream results artifacts (tables/figures consistent with the paper)
- Documentation of wet-lab methods, primers, and study design (docs/)

## Quickstart (recommended order)
1. Install dependencies (first time only):
   - Run: `source("scripts/00_setup.R")`
2. Download + QC (GEO):
   - Run: `source("scripts/01_geo_qc.R")`
3. Differential expression (limma):
   - Run: `source("scripts/02_limma_deg.R")`

Outputs are written to `results/figures/` and `results/tables/`.

## Data availability
- GEO data are downloaded locally by the scripts and cached under `data/geo/` (not committed to GitHub).
- Patient-level qPCR/Ct data are not shared publicly; this repository includes summary tables/figures only.

## Repository structure
- `scripts/` : analysis scripts (R)
- `results/figures/` : generated plots
- `results/tables/` : generated tables
- `docs/` : notes, methods, primers, and rationale
- `data/` : local cache only (no sensitive data)

## Key documentation
- Why these genes/lncRNAs? → `docs/Why these genes-lncRNAs.txt`
- Primer specifications → `docs/primers.md`
- Wet-lab qPCR methods → `docs/wetlab_qpcr_methods.md`

## Notes
This repository was created in 2026 to reconstruct and document the workflow behind the 2021 publication.
