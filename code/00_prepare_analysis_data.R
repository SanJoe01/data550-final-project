set.seed(550)

expr_df <- read.csv("data/BRCA_small.csv", check.names = FALSE)

gene_names <- expr_df[[1]]
expr <- as.matrix(expr_df[, -1, drop = FALSE])
rownames(expr) <- gene_names
storage.mode(expr) <- "numeric"

expr <- expr[complete.cases(expr), , drop = FALSE]
expr <- expr[apply(expr, 1, function(z) all(is.finite(z))), , drop = FALSE]

vars <- apply(expr, 1, var, na.rm = TRUE)
expr <- expr[vars > 0 & is.finite(vars), , drop = FALSE]
vars <- vars[vars > 0 & is.finite(vars)]

top_genes <- rownames(expr)[order(vars, decreasing = TRUE)][1:min(500, nrow(expr))]

X <- t(expr[top_genes, , drop = FALSE])

pca <- prcomp(X, scale. = TRUE)

km <- kmeans(pca$x[, 1:min(5, ncol(pca$x))], centers = 2)

y <- factor(km$cluster, labels = c("Cluster 1", "Cluster 2"))