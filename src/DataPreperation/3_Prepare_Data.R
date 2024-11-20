## SETUPT
library(readr)
library(data.table)
library(dplyr)
library(tidyr)
library(gridExtra)

## INPUT
cleaned_data <- read_csv('../../data/cleaned_data_for_preperation.csv')
setDT(cleaned_data)

## TRANSFORMATION
# Function to create new dummy variables for category that is put in it
seperate_categories <- function(data, category) {
  # Separating Restaurants
  data <- data %>%
    mutate(dummy_variable = ifelse(grepl(category, data$categories, ignore.case = TRUE), 1, 0)) %>%
    rename(!!paste0("dummy_", category) := dummy_variable) 
  
  return(data)
}

# Function to create frequency table of 1s and 0s per category to check validity of the sample
create_frequency_table <- function(data) {
  # Initialize an empty data frame to store the results
  frequency_table <- data.frame(Variable = character(), Count_0 = integer(), Count_1 = integer(), stringsAsFactors = FALSE)
  
  # Loop through variables 12 to 20
  for (i in 12:20) {
    # Get the counts of 0s and 1s
    count_0 <- sum(data[[i]] == 0, na.rm = TRUE)
    count_1 <- sum(data[[i]] == 1, na.rm = TRUE)
    
    # Append the results to the frequency table
    frequency_table <- rbind(frequency_table, data.frame(Variable = names(data)[i], Count_0 = count_0, Count_1 = count_1))
  }
  
  return(frequency_table)
}

# Specify categories we want to create a dummy variable for
categories <- c("Restaurants", "Shopping", "Home Service", "Beauty & Spas", 
                "Health & Medical", "Local Service", "Automotive", 
                "Active Life", "Hotels & Travel")

# Loop the categories through the separate-categories function and 
for (category in categories) {
  cleaned_data <- seperate_categories(cleaned_data, category)
}
prepared_data <- cleaned_data

# Create frequency table of dummy variables though create_frequency_table
frequency_table_categories = create_frequency_table(prepared_data)

## OUTPUT
write.csv(prepared_data, '../../data/prepared_data.csv', row.names = FALSE)

pdf('../../gen/temp/frequency_table_categories.pdf')
grid.table(frequency_table_categories)
dev.off()