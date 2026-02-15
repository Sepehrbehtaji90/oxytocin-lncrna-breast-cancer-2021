install.packages(c("pheatmap"))
if (!requireNamespace("BiocManager", quietly=TRUE)) install.packages("BiocManager")
BiocManager::install(c("GEOquery", "limma"))
