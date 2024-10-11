# Makefile in the src/Analysis directory

# Target to run analysis depends on IMDb_dt.csv
run_analysis: ../../output/IMDb_dt.csv Data_analysis.R
	Rscript Data_analysis.R

# Clean rule to remove generated files (if any)
clean:
	rm -f output_analysis.csv  
# Adjust if you have an output file