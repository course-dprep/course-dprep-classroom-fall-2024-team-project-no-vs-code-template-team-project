## SETUP
library(readr)
library(data.table)
library(dplyr)

## INPUT
business_data <- read_csv('../../data/business_data.csv')
setDT(business_data)

## TRANSFORMATION
# Function to clean data 
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

# Function to create new dummy variables for category that is put in it
seperate_categories <- function(data, category) {
  # Separating Restaurants
  data <- data %>%
  mutate(dummy_variable = ifelse(grepl(category, data$categories, ignore.case = TRUE), 1, 0)) %>%
  rename(!!paste0("dummy_", category) := dummy_variable) 
  
  return(data)
}

# Specify categories we want to create a dummy variable for
categories <- c("Restaurants", "Shopping", "Home Service", "Beauty & Spas", 
                "Health & Medical", "Local Service", "Automotive", 
                "Active Life", "Hotels & Travel")

# Clean the data using the clean_data function
cleaned_data <- clean_data(business_data)

# Loop the categories through the seperate-categories function and 
for (category in categories) {
  cleaned_data <- seperate_categories(cleaned_data, category)
}

## OUTPUT
write.csv(cleaned_data, '../../data/cleaned_data_for_exploration.csv', row.names = FALSE)

