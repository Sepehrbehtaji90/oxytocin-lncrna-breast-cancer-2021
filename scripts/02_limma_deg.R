# scripts/02_limma_deg.R
# Differential expression (tumor vs normal) for GSE54002 using limma
# Outputs:
#   results/tables/limma_topTable.csv
#   results/tables/deg_up_logFC2.csv
#   results/tables/deg_down_logFC2.csv
#   results/tables/deg_up_logFC1.csv
#   results/tables/deg_down_logFC1.csv

suppressPackageStartupMessages({
  library(GEOquery)
  library(limma)
})

dir.create("results/tables", recursive = TRUE, showWarnings = FALSE)
dir.create("data/geo", recursive = TRUE, showWarnings = FALSE)

# Load normalized GEO object if you created it in script 01,
# otherwise download and normalize here.
gset_path <- "data/geo/gset_norm.rds"
if (file.exists(gset_path)) {
  gset <- readRDS(gset_path)
} else {
  series <- "GSE54002"
  platform <- "GPL570"
  gset_list <- getGEO(series, GSEMatrix = TRUE, AnnotGPL = TRUE)
  idx <- if (length(gset_list) > 1) grep(platform, names(gset_list)) else 1
  gset <- gset_list[[idx]]

  ex <- exprs(gset)
  ex <- normalizeBetweenArrays(ex, method = "quantile")
  exprs(gset) <- ex
}

ex <- exprs(gset)

# Manual group labels (as requested)
gr <- c(rep("tumor", 300), rep("normal", 16), rep("tumor", 117))

# Sanity checks
stopifnot(ncol(ex) == length(gr))
stopifnot(sum(gr == "tumor") == 417)
stopifnot(sum(gr == "normal") == 16)

# Safety check: verify manual ordering matches GEO metadata
meta <- pData(gset)
if ("title" %in% colnames(meta)) {
  truth <- ifelse(grepl("^Non-tumor", meta$title, ignore.case = TRUE), "normal", "tumor")
  mismatch <- sum(truth != gr)
  if (mismatch > 0) {
    stop(paste0("Mismatch with metadata in ", mismatch,
                " samples. Manual ordering likely wrong."))
  }
} else {
  warning("No 'title' column found in metadata; skipping mismatch check.")
}

# limma design and contrast
gr <- factor(gr, levels = c("normal", "tumor"))
gset$group <- gr

design <- model.matrix(~ group + 0, gset)
colnames(design) <- levels(gr)

fit <- lmFit(gset, design)
cont <- makeContrasts(tumor - normal, levels = design)
fit2 <- eBayes(contrasts.fit(fit, cont))

tt <- topTable(fit2, adjust.method = "BH", number = Inf, sort.by = "B")

# Keep a compact set of columns if present
keep_cols <- intersect(
  c("Gene.symbol", "ID", "adj.P.Val", "P.Value", "logFC", "AveExpr", "t", "B"),
  colnames(tt)
)
tt_out <- tt[, keep_cols, drop = FALSE]

write.csv(tt_out, "results/tables/limma_topTable.csv", row.names = FALSE)

# DEG lists using paper-style microarray thresholds: |logFC| > 2, adj.P < 0.05
deg_up_2   <- subset(tt_out, adj.P.Val < 0.05 & logFC >  2)
deg_down_2 <- subset(tt_out, adj.P.Val < 0.05 & logFC < -2)

write.csv(deg_up_2,   "results/tables/deg_up_logFC2.csv", row.names = FALSE)
write.csv(deg_down_2, "results/tables/deg_down_logFC2.csv", row.names = FALSE)

# Optional: also export |logFC| > 1 (some parts of your write-up used this)
deg_up_1   <- subset(tt_out, adj.P.Val < 0.05 & logFC >  1)
deg_down_1 <- subset(tt_out, adj.P.Val < 0.05 & logFC < -1)

write.csv(deg_up_1,   "results/tables/deg_up_logFC1.csv", row.names = FALSE)
write.csv(deg_down_1, "results/tables/deg_down_logFC1.csv", row.names = FALSE)

cat("Done. Wrote outputs to results/tables/\n")

