install.packages(c("pheatmap"))
if (!requireNamespace("BiocManager", quietly=TRUE)) install.packages("BiocManager")
BiocManager::install(c("GEOquery", "limma"))



# scripts/01_geo_qc.R
library(GEOquery)
library(limma)
library(pheatmap)

dir.create("data/geo", recursive = TRUE, showWarnings = FALSE)
dir.create("results/figures", recursive = TRUE, showWarnings = FALSE)

series <- "GSE54002"
platform <- "GPL570"

gset_list <- getGEO(series, GSEMatrix = TRUE, AnnotGPL = TRUE)
idx <- if (length(gset_list) > 1) grep(platform, names(gset_list)) else 1
gset <- gset_list[[idx]]

ex <- exprs(gset)

# Standard quantile normalization (limma)
ex <- normalizeBetweenArrays(ex, method = "quantile")
exprs(gset) <- ex

# Manual group labels (as you requested)
gr <- c(rep("tumor", 300), rep("normal", 16), rep("tumor", 117))

# Safety checks
stopifnot(ncol(ex) == length(gr))
stopifnot(sum(gr == "tumor") == 417)
stopifnot(sum(gr == "normal") == 16)

# Validate manual ordering using metadata title (prevents silent errors)
meta <- pData(gset)
truth <- ifelse(grepl("^Non-tumor", meta$title, ignore.case = TRUE), "normal", "tumor")
mismatch <- sum(truth != gr)
if (mismatch > 0) stop(paste0("Mismatch with metadata in ", mismatch, " samples. Manual ordering likely wrong."))

# Boxplot
pdf("results/figures/boxplot.pdf", width = 16, height = 6)
boxplot(ex, outline = FALSE)
dev.off()

# Correlation heatmap
pdf("results/figures/corr_heatmap.pdf", width = 12, height = 12)
pheatmap(cor(ex), labels_row = gr, labels_col = gr, border_color = NA)
dev.off()

# PCA (samples are columns, so transpose)
pc <- prcomp(t(ex))
pdf("results/figures/pca.pdf", width = 8, height = 6)
plot(pc$x[,1:2], col = as.factor(gr), pch = 19, xlab = "PC1", ylab = "PC2")
legend("topright", legend = levels(as.factor(gr)), col = 1:2, pch = 19)
dev.off()

saveRDS(gset, "data/geo/gset_norm.rds")

