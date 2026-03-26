# code/02_make_figure.R

# Create PCA figure

if (!exists("pca") || !exists("y")) {
  source("../code/00_prepare_analysis_data.R")
}

plot(
  pca$x[, 1],
  pca$x[, 2],
  col = y,
  pch = 16,
  xlab = "Principal Component 1",
  ylab = "Principal Component 2",
  main = "Figure 1. PCA of TCGA-BRCA Gene Expression"
)

legend(
  "topright",
  legend = levels(y),
  col = 1:2,
  pch = 16
)