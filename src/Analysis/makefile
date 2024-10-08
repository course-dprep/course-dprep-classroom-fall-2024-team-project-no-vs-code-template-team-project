DATA = ../../data
OUTPUT = ../../gen/output

all: install.packages $(OUTPUT)/Final_Analysis.pdf

install.packages: 
	R --vanilla < 0_Install_Packages.R

$(OUTPUT)/Final_Analysis.pdf: $(DATA)/prepared_data.csv
	Rscript -e "rmarkdown::render('1_Analysis.Rmd', output_file = '../../gen/output/Final_Report.pdf')"
