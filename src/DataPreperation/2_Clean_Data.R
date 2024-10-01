## SETUP
library(readr)
library(data.table)
library(dplyr)

## INPUT
business_data <- read_csv('../../data/business_data.csv')
setDT(business_data)

## TRANSFORMATION
clean_data <- function(data) {
  # Remove unnecessary columns
  cleaned_data <- business_data %>%
    select(-latitude, -longitude, -hours) %>%
    select(business_id, name, is_open, address, postal_code, city, state, categories, review_count, stars, attributes)
  
  # Keep only open businesses
  cleaned_data <- cleaned_data %>%
    filter(is_open == 1)
  
  # Remove rows with NAs in necessary columns
  cleaned_data <- cleaned_data %>%
    filter(!is.na(address) & !is.na(postal_code) & !is.na(attributes))
  
  # Remove businesses with fewer than 50 reviews
  cleaned_data <- cleaned_data %>%
    filter(review_count >= 50)
  
  return(cleaned_data)  # Return the cleaned data
}

# Clean the data using the clean_data function
cleaned_data <- clean_data(business_data)

## OUTPUT
write.csv(cleaned_data, '../../data/cleaned_data_for_preperation.csv', row.names = FALSE)
