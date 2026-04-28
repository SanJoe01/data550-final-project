all: report/report_final_project.html

report/report_final_project.html: report_final_project.Rmd code/00_prepare_analysis_data.R code/02_make_figure.R code/03_make_table.R
	Rscript -e "rmarkdown::render('report_final_project.Rmd', output_dir = 'report')"

docker-run:
	mkdir -p report
	docker run --rm -v "$(shell pwd)/report:/home/project/report" sanjoe01/data550-final-project

docker-run-win:
	mkdir -p report
	docker run --rm -v "/$(shell pwd)/report:/home/project/report" sanjoe01/data550-final-project