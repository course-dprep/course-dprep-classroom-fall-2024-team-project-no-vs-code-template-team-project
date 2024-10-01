DATA = ../../data
TEMP = ../../gen/temp

all: install.packages $(DATA)/business_data.csv $(DATA)/cleaned_data_for_preperation.csv $(DATA)/prepared_data.csv $(TEMP)/frequency_table_categories.pdf

install.packages:
	R --vanilla < 0_Install_Packages.R

$(DATA)/business_data.csv: 
	Rscript -e "ifelse(!dir.exists('../../data'),dir.create('../../data'),'Directory Exists')"
	R --vanilla < 1_Import_Data.R

$(DATA)/cleaned_data_for_preperation.csv: $(DATA)/business_data.csv
	R --vanilla < 2_Clean_Data.R

$(DATA)/prepared_data.csv: $(DATA)/cleaned_data_for_preperation.csv
	Rscript -e "ifelse(!dir.exists('../../gen'),dir.create('../../gen'),'Directory Exists')"
	Rscript -e "ifelse(!dir.exists('../../gen/temp'),dir.create('../../gen/temp'),'Directory Exists')"
	R --vanilla < 3_Prepare_Data.R

$(TEMP)/frequency_table_categories.pdf: $(DATA)/cleaned_data_for_preperation.csv
	R --vanilla < 3_Prepare_Data.R