DATA = ../../data
TEMP = ../../gen/temp

all: $(DATA)/business_data.csv $(DATA)/cleaned_data_for_preperation.csv $(DATA)/prepared_data.csv $(TEMP)/frequency_table_categories.pdf

install:
	R --vanilla < Install_Packages.R

$(DATA)/business_data.csv: Import_Data.R
	Rscript -e "ifelse(!dir.exists('../../data'),dir.create('../../data'),'Directory Exists')"
	R --vanilla < Import_Data.R

$(DATA)/cleaned_data_for_preperation.csv: $(DATA)/business_data.csv Clean_Data.R
	R --vanilla < Clean_Data.R

$(DATA)/prepared_data.csv: $(DATA)/cleaned_data_for_preperation.csv Prepare_Data.R
	Rscript -e "ifelse(!dir.exists('../../gen'),dir.create('../../gen'),'Directory Exists')"
	Rscript -e "ifelse(!dir.exists('../../gen/temp'),dir.create('../../gen/temp'),'Directory Exists')"
	R --vanilla < Prepare_Data.R

$(TEMP)/frequency_table_categories.pdf: $(DATA)/cleaned_data_for_preperation.csv Prepare_Data.R
	R --vanilla < Prepare_Data.R