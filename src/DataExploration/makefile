DATA = ../../data
output = ../../gen/output

all: $(DATA)/business_data.csv $(DATA)/cleaned_data_for_exploration.csv $(OUTPUT)/star_rating_summary.xlsx $(OUTPUT)/data_visualization_graphs.pdf

install:
	R --vanilla < Install_Packages.R

$(DATA)/business_data.csv: Import_Data.R
	Rscript -e "ifelse(!dir.exists('../../data'),dir.create('../../data'),'Directory Exists')"
	R --vanilla < Import_Data.R

$(DATA)/cleaned_data_for_exploration.csv: $(DATA)/business_data.csv Clean_Data.R
	R --vanilla < Clean_Data.R

$(OUTPUT)/star_rating_summary.xlsx: $(DATA)/cleaned_data_for_exploration.csv Star_and_Review_Analysis.R
	Rscript -e "ifelse(!dir.exists('../../gen'),dir.create('../../gen'),'Directory Exists')"
	Rscript -e "ifelse(!dir.exists('../../gen/output'),dir.create('../../gen/output'),'Directory Exists')"
	R --vanilla < Star_and_Review_Analysis.R

$(OUTPUT)/data_visualization_graphs.pdf: $(DATA)/cleaned_data_for_exploration.csv Visualization.R
	R --vanilla < Visualization.R

$(OUTPUT)/top_20_categories.xlsx: $(DATA)/cleaned_data_for_exploration.csv Visualization.R
	R --vanilla < Visualization.R
