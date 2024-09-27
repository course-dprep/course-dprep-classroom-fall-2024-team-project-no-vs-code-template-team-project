---
title: "Data Preparation"
output: 
  pdf_document: default
---

```{r setup, include=FALSE}
# Source necessary scripts
source("scripts/install_and_import.R")  
source("scripts/import_data.R")          
source("scripts/data_cleaning.R")          
source("scripts/data_preparation.R")          

# Load your data
data_business <- import_data()  # Call the import function 

# Clean the data
cleaned_data <- clean_data(data_business)

# Prepare the data
prepared_data <- prepare_data(cleaned_data)

# Display the final prepared dataframe
head(prepared_data)
``` 