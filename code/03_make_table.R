# code/03_make_table.R

suppressPackageStartupMessages({
  library(glmnet)
  library(gt)
})

if (!exists("X") || !exists("y")) {
  source("../code/00_prepare_analysis_data.R")
}

X_train <- as.matrix(X)

cvfit <- cv.glmnet(
  x = X_train,
  y = y,
  family = "binomial",
  alpha = 1
)

coef_mat <- as.matrix(coef(cvfit, s = "lambda.1se"))

coef_df <- data.frame(
  Gene = rownames(coef_mat),
  Coefficient = as.numeric(coef_mat[, 1])
)

coef_df <- coef_df[
  coef_df$Gene != "(Intercept)" & coef_df$Coefficient != 0,
]

table1_gt <- coef_df |>
  head(15) |>
  gt() |>
  tab_header(
    title = "Table 1. Top Genes Selected by LASSO",
    subtitle = "Non-zero coefficients at lambda.1se"
  ) |>
  fmt_number(columns = "Coefficient", decimals = 4)