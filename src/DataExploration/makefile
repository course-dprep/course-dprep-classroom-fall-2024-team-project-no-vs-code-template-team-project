DATA = ../../data
TEMP = ../../gen/temp
OUTPUT = ../../gen/output

all: install.packages $(DATA)/business_data.csv $(DATA)/cleaned_data_for_exploration.csv $(TEMP)/top_true_attributes.csv $(TEMP)/top_false_attributes.csv $(OUTPUT)/data_visualization_graphs.pdf $(OUTPUT)/data_visualization_TopTrueAttributes.xlsx $(OUTPUT)/data_visualization_TopFalseAttributes.xlsx

install.packages:
	R --vanilla < 0_Install_Packages.R

$(DATA)/business_data.csv: 
	Rscript -e "ifelse(!dir.exists('../../data'),dir.create('../../data'),'Directory Exists')"
	R --vanilla < 1_Import_Data.R

$(DATA)/cleaned_data_for_exploration.csv: ../../data/business_data.csv
	R --vanilla < 2_Clean_Data.R

$(TEMP)/top_true_attributes.csv: $(DATA)/cleaned_data_for_exploration.csv
	Rscript -e "ifelse(!dir.exists('../../gen'),dir.create('../../gen'),'Directory Exists')"
	Rscript -e "ifelse(!dir.exists('../../gen/temp'),dir.create('../../gen/temp'),'Directory Exists')"
	R --vanilla < 3_Category_Analysis.R

$(TEMP)/top_false_attributes.csv: $(DATA)/cleaned_data_for_exploration.csv
	R --vanilla < 3_Category_Analysis.R

$(OUTPUT)/data_visualization_graphs.pdf: $(DATA)/cleaned_data_for_exploration.csv
	Rscript -e "ifelse(!dir.exists('../../gen/output'),dir.create('../../gen/output'),'Directory Exists')"
	R --vanilla < 4_Visualization.R

$(OUTPUT)/data_visualization_TopTrueAttributes.xlsx: $(DATA)/cleaned_data_for_exploration.csv $(TEMP)/top_false_attributes.csv $(TEMP)/top_true_attributes.csv
	R --vanilla < 4_Visualization.R

$(OUTPUT)/data_visualization_TopFalseAttributes.xlsx: $(DATA)/cleaned_data_for_exploration.csv $(TEMP)/top_false_attributes.csv $(TEMP)/top_true_attributes.csv
	R --vanilla < 4_Visualization.R