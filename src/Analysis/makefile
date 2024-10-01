DATA = ../../data
OUTPUT = ../../gen/output

all: install.packages

install.packages: XXX
	R --vanilla < 0_Install_Packages.R

XXX: $(DATA)/prepared_data.csv
	R --vanilla < 1_ANOVA_Analysis.R