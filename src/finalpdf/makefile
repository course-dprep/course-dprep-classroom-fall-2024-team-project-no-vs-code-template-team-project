DATA = ../../data
OUTPUT = ../../gen/final-report/output

$(OUTPUT)/Final.pdf: Final.Rmd $(DATA)/data.csv 
	R -e "dir.create('../../gen/final-report/output', recursive = TRUE)"
	Rscript -e 'rmarkdown::render("Final.Rmd", output_dir = "$(OUTPUT)")'