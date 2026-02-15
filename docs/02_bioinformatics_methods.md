# Bioinformatics methods

## GEO dataset
- Dataset: GSE54002 (Gene Expression Omnibus)
- Platform: GPL570
- Samples: 417 breast cancer (tumour) and 16 non-tumour tissues (laser capture microdissection)

## Preprocessing and differential expression (limma)
- R version: 3.6.1
- limma package: 3.40.6
- Expression matrix: log2 values
- Normalization: quantile normalization
- Differential expression: limma empirical Bayes
- Multiple testing correction: Benjamini–Hochberg (FDR)
- DEG cutoffs (microarray discovery):
  - adj.P.Val < 0.05
  - logFC > 2 (up-regulated)
  - logFC < -2 (down-regulated)

## Pathway enrichment
- Enrichment tool: Enrichr
- Pathway database: KEGG
- Approach: perform enrichment on the DEG list; from down-regulated genes, select those associated with the oxytocin signalling pathway.

## Selection of lncRNAs
- lncRNAs associated with oxytocin-pathway genes were selected based on prior evidence, including the Khalil et al. study (GSE16226).
- As an additional verification step, target genes were queried in the lnc2target database and lncRNAs with suitable statistical support were selected.

## Outputs (repository)
- DEG tables exported to `results/tables/`
- QC figures exported to `results/figures/`

