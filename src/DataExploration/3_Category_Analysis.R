## SETUP
library(data.table)
library(jsonlite)
library(dplyr)
library(tidyr)
library(stringr)

## INPUT
load('../../data/cleaned_data_for_exploration.RData')
setDT(cleaned_data)

## TRANSFORMATION
# Analysis of the different categories 
# Function to perform summary statistics and quartile analysis
analyze_data <- function(data) {
  # Summary statistics for stars
  star_summary <- data.frame(
    Statistic = c("Mean Star Rating", "Median Star Rating", "Min Star Rating",
                  "Max Star Rating", "Rounded Mean Star Rating"),
    Value = c(mean(data$stars, na.rm = TRUE),
              median(data$stars, na.rm = TRUE),
              min(data$stars, na.rm = TRUE),
              max(data$stars, na.rm = TRUE),
              round(mean(data$stars, na.rm = TRUE), 2))
  )
  
  # Summary statistics for review counts
  review_summary <- data.frame(
    Statistic = c("Mean Review Count", "Median Review Count", 
                  "Min Review Count", "Max Review Count"),
    Value = c(mean(data$review_count, na.rm = TRUE),
              median(data$review_count, na.rm = TRUE),
              min(data$review_count, na.rm = TRUE),
              max(data$review_count, na.rm = TRUE))
  )
  
  # Calculate quartiles
  quartile_boundaries <- quantile(data$review_count, probs = 0:4/4, na.rm = TRUE)
  data$quartile <- cut(data$review_count,
                       breaks = quartile_boundaries,
                       include.lowest = TRUE,
                       labels = c("1st Quartile", "2nd Quartile", "3rd Quartile", "4th Quartile"))
  
  # Attributes analysis
  attribute_counts <- data %>%
    mutate(attributes = strsplit(as.character(attributes), ", ")) %>%
    unnest(attributes) %>%
    mutate(attributes = str_remove_all(attributes, "‘|’|\"|\\s*:\\s*False|\\s*:\\s*True")) 
  
  top_true_attributes <- attribute_counts %>%
    filter(str_detect(attributes, "True")) %>%
    count(attributes, sort = TRUE) %>%
    top_n(30, n) %>%
    arrange(desc(n))
  
  top_false_attributes <- attribute_counts %>%
    filter(str_detect(attributes, "False")) %>%
    count(attributes, sort = TRUE) %>%
    top_n(30, n) %>%
    arrange(desc(n))
  
  return(list(star_summary = star_summary, 
              review_summary = review_summary,
              data = data,
              top_true_attributes = top_true_attributes,
              top_false_attributes = top_false_attributes))
}
analzyed_data <- analyze_data(cleaned_data)

## OUTPUT
top_true_attributes = analzyed_data$top_true_attributes
write.csv(top_true_attributes, '../../gen/temp/top_true_attributes.csv')

top_false_attributes = analzyed_data$top_false_attributes
write.csv(top_false_attributes, '../../gen/temp/top_false_attributes.csv')
