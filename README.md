# DATA 550 Final Project

## Project overview

This project analyzes TCGA-BRCA gene expression data using machine learning methods. The workflow includes variance filtering, principal component analysis (PCA), k-means clustering, and LASSO logistic regression.

The final report includes:
- a PCA figure for sample visualization
- a table of genes selected by the LASSO model

## Repository structure

- `report_final_project.Rmd`: source file for the final report
- `report/`: output folder for the compiled report
- `code/00_prepare_analysis_data.R`: prepares analysis objects by reading the processed dataset from `data/BRCA_small.csv`
- `code/01_download_data_unused.txt`: documents the original TCGA data download process (not required for report generation)
- `code/02_make_figure.R`: code for generating the PCA figure
- `code/03_make_table.R`: code for generating the LASSO-selected gene table
- `data/BRCA_small.csv`: processed expression dataset used to reproduce the report
- `data/BRCA_clinical_small.csv`: matching sample metadata
- `data/data_inventory.csv`: summary of included data files
- `Dockerfile`: builds the Docker image
- `Makefile`: contains commands for reproducible workflow

## Data note

The processed dataset is included in the repository to ensure reproducibility without requiring external data downloads during Docker execution.

The original data download script is preserved as `code/01_download_data_unused.txt` for documentation purposes only.

## Restore package environment locally

From the project root directory, run:

```bash
make install
```

This runs `renv::restore()` to synchronize the local R package environment.

## Generate the report locally

From the project root directory, run:

```bash
make
```

The compiled report will be written to:

```text
report/report_final_project.html
```

## Docker

### Build the Docker image locally

```bash
docker build -t sanjoe01/data550-final-project .
```

### DockerHub image

The public Docker image is available at:

```text
https://hub.docker.com/r/sanjoe01/data550-final-project
```

### Generate the report using Docker

For Mac/Linux:

```bash
make docker-run
```

For Windows Git Bash:

```bash
make docker-run-win
```

After the command completes, the report will be available in:

```text
report/report_final_project.html
```

