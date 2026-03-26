# code/00_prepare_analysis_data.R

# Prepare shared analysis objects for the TCGA-BRCA final project

suppressPackageStartupMessages({
  library(curatedTCGAData)
  library(SummarizedExperiment)
})

set.seed(550)

# Download/load TCGA-BRCA RNA-seq normalized data
tcga <- curatedTCGAData(
  diseaseCode = "BRCA",
  assays = "RNASeq2GeneNorm",
  version = "2.1.1",
  dry.run = FALSE
)

se <- tcga[[1]]
expr <- assay(se)

# Select top 500 most variable genes
vars <- apply(expr, 1, var)
top_genes <- names(sort(vars, decreasing = TRUE))[1:500]

# Build sample-by-gene matrix
X <- t(expr[top_genes, , drop = FALSE])

# PCA
pca <- prcomp(X, scale. = TRUE)

# K-means clustering using first 5 PCs
km <- kmeans(pca$x[, 1:5], centers = 2)

# Cluster labels for downstream modeling
y <- factor(km$cluster, labels = c("Cluster 1", "Cluster 2"))