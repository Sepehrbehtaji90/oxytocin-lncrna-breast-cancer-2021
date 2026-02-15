# oxytocin-lncrna-breast-cancer-2021
Reproducible R pipeline and results artifacts for the 2021 Scientific Reports study on oxytocin-related lncRNAs/genes in breast cancer (GSE54002 + qPCR + correlations + ROC/ML).

https://pubmed.ncbi.nlm.nih.gov/33742056/

# Oxytocin-related lncRNAs in breast cancer (2021) — Reproducible pipeline

This repository documents and reproduces the analysis workflow behind the 2021 Scientific Reports study on oxytocin-related genes and lncRNAs in breast cancer.

## What is included
- GEO microarray analysis: GSE54002 → limma differential expression → DEG lists
- QC figures (boxplot, correlation heatmap, PCA)
- Downstream results artifacts (tables/figures from the paper)

## Repository structure
- `scripts/` : analysis scripts (R)
- `results/figures/` : generated plots
- `results/tables/` : generated tables
- `docs/` : notes, methods, data availability
- `data/` : (not containing sensitive patient data)

## Notes
This repository was created in 2026 to reconstruct and document the workflow behind the 2021 publication.
