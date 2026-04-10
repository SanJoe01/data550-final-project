all: report/report_final_project.html

install:
	Rscript -e "renv::restore()"

report/report_final_project.html: report/report_final_project.Rmd code/00_prepare_analysis_data.R code/02_make_figure.R code/03_make_table.R
	Rscript -e "rmarkdown::render('report/report_final_project.Rmd')"