# Makefile in src directory

# Target to explore data depends on cleaned_data.csv
explore: Data_Exploration.R cleaned_data.csv
	Rscript Data_Exploration.R

# Target to clean data depends on raw_data.csv and runs data_cleaning.R
cleaned_data.csv: Data_Cleaning.R raw_data.csv
	Rscript Data_Cleaning.R

# Target to load data depends on Data_loading.R and generates raw_data.csv
raw_data.csv: Data_Loading.R
	Rscript Data_Loading.R

# Clean rule to remove generated files
clean:
	rm -f raw_data.csv cleaned_data.csv
