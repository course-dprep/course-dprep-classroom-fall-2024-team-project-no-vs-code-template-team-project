## SETUP (put the list of libraries that should be loaded)
library(readr)
library(data.table)

## INPUT
data <- read_csv('../../data/prepared_data.csv')
setDT(data)

## TRANSFORMATION (do the analysis here)

## OUTPUT (write the output here - regression table, interesting output of the analysis)
