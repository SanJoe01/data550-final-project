# code/01_download_data.R

suppressPackageStartupMessages({
  library(curatedTCGAData)
  library(SummarizedExperiment)
})

dir.create("data", showWarnings = FALSE, recursive = TRUE)

tcga <- curatedTCGAData(
  diseaseCode = "BRCA",
  assays = "RNASeq2GeneNorm",
  version = "2.1.1",
  dry.run = FALSE
)

se <- tcga[[1]]
expr <- assay(se)
clinical <- as.data.frame(colData(se))

expr_small <- expr[1:500, 1:100, drop = FALSE]
expr_small_df <- as.data.frame(expr_small)
expr_small_df <- cbind(gene = rownames(expr_small_df), expr_small_df)

write.csv(
  expr_small_df,
  file = "data/BRCA_small.csv",
  row.names = FALSE
)

sample_ids <- colnames(expr_small)
clinical_small <- clinical[match(sample_ids, rownames(clinical)), , drop = FALSE]
clinical_small <- cbind(sample_id = rownames(clinical_small), clinical_small)

write.csv(
  clinical_small,
  file = "data/BRCA_clinical_small.csv",
  row.names = FALSE
)

info <- data.frame(
  object = c("small_expression_matrix", "clinical_small"),
  n_rows = c(nrow(expr_small_df), nrow(clinical_small)),
  n_cols = c(ncol(expr_small_df), ncol(clinical_small))
)

write.csv(
  info,
  file = "data/data_inventory.csv",
  row.names = FALSE
)

cat("Done.\n")