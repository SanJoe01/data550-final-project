# DATA 550 Final Project

## Project overview
This project analyzes TCGA-BRCA gene expression data using machine learning methods.  
The workflow includes variance filtering, principal component analysis (PCA), k-means clustering, and LASSO logistic regression.

The final report includes:
- a PCA figure for sample visualization
- a table of genes selected by the LASSO model

## Repository structure
- `report/report_final_project.Rmd`: source file for the final report
- `report/report_final_project.html`: rendered final report
- `code/00_prepare_analysis_data.R`: prepares the main analysis objects used in the report
- `code/01_download_data.R`: downloads and exports small repository data files
- `code/02_make_figure.R`: code for the required figure
- `code/03_make_table.R`: code for the required table
- `data/BRCA_small.csv`: small shareable expression dataset included for repository display
- `data/BRCA_clinical_small.csv`: matching sample metadata
- `data/data_inventory.csv`: summary of included repository data files

## Restore package environment
From the project root directory, run:

```bash
make install
```
This command runs `renv::restore()` to synchronize the project package environment.

```
## How to generate the final report
From the project root directory, run:

```r
rmarkdown::render("report/report_final_project.Rmd")
```