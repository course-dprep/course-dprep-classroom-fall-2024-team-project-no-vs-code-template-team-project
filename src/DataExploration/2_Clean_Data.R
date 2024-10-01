## SETUP
library(readr)
library(data.table)
library(jsonlite)
library(dplyr)
library(tidyr)
library(stringr)

## INPUT
business_data <- read_csv('../../data/business_data.csv')
setDT(business_data)

## TRANSFORMATION
# Function to parse the attribute string into a named list
parse_attributes <- function(attr_string) {
  # Clean the string to make it valid JSON syntax
  cleaned_string <- gsub("u'", "'", attr_string)  # Remove the 'u' prefix
  cleaned_string <- gsub("'", "\"", cleaned_string)  # Replace single quotes with double quotes
  cleaned_string <- gsub("\\\\\"", "\"", cleaned_string)  # Remove escape characters before quotes
  cleaned_string <- gsub('"(True|False)"', '\\L\\1', cleaned_string, perl = TRUE)  # Convert "True"/"False" to lowercase
  cleaned_string <- gsub(": None", ": null", cleaned_string)  # Replace None with null
  
  # Remove any invalid escaping inside JSON strings
  cleaned_string <- gsub('(?<=:)\\s*""(.*?)""', '"\\1"', cleaned_string, perl = TRUE)
  
  # Ensure the string is enclosed in curly braces
  cleaned_string <- paste0("{", str_remove_all(cleaned_string, "^\\{|\\}$"), "}")
  
  # Attempt to parse the string into a list
  parsed_list <- tryCatch(fromJSON(cleaned_string), error = function(e) NULL)
  
  return(parsed_list)
}

# Apply the parse_attributes function to each row and convert to a dataframe
parsed_attributes <- business_data %>%
  mutate(attributes_list = lapply(attributes, parse_attributes)) %>%
  unnest_wider(attributes_list)

# Display the resulting dataframe
parsed_attributes <- as.data.frame(parsed_attributes)

## OUTPUT
cleaned_data <- parsed_attributes
save(cleaned_data, file = '../../data/cleaned_data_for_exploration.RData')

