## SETUPT
library(readr)
library(data.table)
library(jsonlite)
library(dplyr)
library(tidyr)
library(stringr)
library(writexl)

## INPUT
clean_data <- read_csv('../../data/cleaned_data_for_preperation')
setDT(clean_data)

## TRANSFORMATION
# Function to parse the attribute string into a named list
parse_attributes <- function(attr_string) {
  cleaned_string <- gsub("u'", "'", attr_string)
  cleaned_string <- gsub("'", "\"", cleaned_string)
  cleaned_string <- gsub("\\\\\"", "\"", cleaned_string)
  cleaned_string <- gsub('"(True|False)"', '\\L\\1', cleaned_string, perl = TRUE)
  cleaned_string <- gsub(": None", ": null", cleaned_string)
  cleaned_string <- gsub('(?<=:)\\s*""(.*?)""', '"\\1"', cleaned_string, perl = TRUE)
  cleaned_string <- paste0("{", str_remove_all(cleaned_string, "^\\{|\\}$"), "}")
  
  parsed_list <- tryCatch(fromJSON(cleaned_string), error = function(e) NULL)
  return(parsed_list)
}

# Function to prepare data and create dummy variables
prepare_data <- function(data) {
  # Convert attribute variables to dummy variables
  data_attributes_parsed <- data %>%
    mutate(across(everything(), as.character)) %>%
    mutate(across(12:42, ~ recode(., 'NULL' = '0', 'FALSE' = '0', 'None' = '0', 'none' = '0', 
            'TRUE' = '1', 'free' = '1', 'beer_and_wine' = '1', 'full_bar' = '1', 'casual' = '1')))
  
  # Rename specific attributes
  names(data_attributes_parsed)[names(data_attributes_parsed) == 'WiFi'] <- 'FreeWiFi'
  names(data_attributes_parsed)[names(data_attributes_parsed) == 'RestaurantAttire'] <- 'RestaurantCasualAttire'
  
  # Replace NAs with 0
  data_attributes_parsed[is.na(data_attributes_parsed)] <- '0'
  
  return(data_attributes_parsed)  # Return the prepared data frame
}

# Function to create frequency table of 1s per attribute
freq_table <- function(data) {
  # Create frequency table of 1s per attribute
  attribute1_freq <- data %>% select(12:42) %>%
  summarise(across(everything(), ~sum(. == "1"), .names = "{col}_1"))
  
  # Print frequency table
  print(attribute1_freq)
}

## OUTPUT
clean_data <- clean_data %>%
  mutate(attributes_list = lapply(attributes, parse_attributes)) %>%
  unnest_wider(attributes_list)
prepared_data <- prepare_data(clean_data)
attributes_1_freq = freq_table(prepared_data)

save(prepared_data, file = '../../data/prepared_data.RData')
write_xlsx(attributes_1_freq, '../../gen/output/attributes_1_frequency.xlsx')
