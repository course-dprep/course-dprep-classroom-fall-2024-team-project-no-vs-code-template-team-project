DATA = ../../data
output = ../../gen/output

all: install.packages $(DATA)/business_data.csv $(DATA)/cleaned_data_for_exploration.csv $(OUTPUT)/star_rating_summary.xlsx $(OUTPUT)/data_visualization_graphs.pdf $(OUTPUT)/data_exploration_merge

install.packages:
	R --vanilla < 0_Install_Packages.R

$(DATA)/business_data.csv: 
	Rscript -e "ifelse(!dir.exists('../../data'),dir.create('../../data'),'Directory Exists')"
	R --vanilla < 1_Import_Data.R

$(DATA)/cleaned_data_for_exploration.csv: $(DATA)/business_data.csv
	R --vanilla < 2_Clean_Data.R

$(OUTPUT)/star_rating_summary.xlsx: $(DATA)/cleaned_data_for_exploration.csv
	Rscript -e "ifelse(!dir.exists('../../gen'),dir.create('../../gen'),'Directory Exists')"
	Rscript -e "ifelse(!dir.exists('../../gen/output'),dir.create('../../gen/output'),'Directory Exists')"
	R --vanilla < 3_Star_and_Review_Analysis.R

$(OUTPUT)/data_visualization_graphs.pdf: $(DATA)/cleaned_data_for_exploration.csv
	R --vanilla < 4_Visualization.R

$(OUTPUT)/top_20_categories.xlsx: $(DATA)/cleaned_data_for_exploration.csv
	R --vanilla < 4_Visualization.R

$(OUTPUT)/data_exploration_merged.pdf: 
	Rscript -e 'rmarkdown::render("DataExploration.Rmd")
