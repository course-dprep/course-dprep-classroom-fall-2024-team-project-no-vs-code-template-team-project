DATA = ../../data
TEMP = ../../gen/data-preparation/temp
OUTPUT = ../../gen/data-preparation/output

all: $(OUTPUT)/data_exploration.html

$(DATA)/data1.csv $(DATA)/data2.csv $(DATA)/data3.csv: download_data.R
	R --vanilla < download_data.R

$(TEMP)/data.csv: merge_data.R $(DATA)/data2.csv $(DATA)/data3.csv
	R -e "dir.create('../../gen/data-preparation/temp', recursive = TRUE)"
	R --vanilla < merge_data.R

$(TEMP)/data_cleaned.csv: clean_data.R $(TEMP)/data.csv
	R --vanilla < clean_data.R
	
$(OUTPUT)/data.csv: data_exploration.R $(TEMP)/data_cleaned.csv
	R -e "dir.create('../../gen/data-preparation/output', recursive = TRUE)"
	R --vanilla < data_exploration.R

$(OUTPUT)/data_exploration.html: data_exploration.Rmd $(OUTPUT)/data.csv render.R 
	Rscript -e "rmarkdown::render('data_exploration.Rmd', output_dir = '../../gen/data-preparation/output')"

	
clean:
	R -e "unlink('*.pdf')"
	R -e "unlink('*.html')"
	R -e "unlink('$(DATA)', recursive = TRUE)"
	R -e "unlink('$(TEMP)', recursive = TRUE)"
	R -e "unlink('$(OUTPUT)', recursive = TRUE)"