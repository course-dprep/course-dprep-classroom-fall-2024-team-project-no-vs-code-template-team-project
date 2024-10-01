## SETUP
library(readr)
library(data.table)
library(jsonlite)
library(dplyr)
library(tidyr)
library(stringr)
library(ggplot2)
library(writexl)

## INPUT
load('../../data/cleaned_data_for_exploration.RData')
top_true_attributes <- read_csv('../../gen/temp/top_true_attributes.csv')
top_false_attributes <- read_csv('../../gen/temp/top_false_attributes.csv')
setDT(cleaned_data)
setDT(top_true_attributes)

## TRANSFORMATION
# visualization of graphs 
# Function to create visualizations
create_visualizations <- function(data) {
  
  # Visualization for stars distribution
  star_plot <- ggplot(data, aes(x = stars)) +
    geom_histogram(binwidth = 1, fill = "blue", color = "black", alpha = 0.7) +
    labs(title = "Distribution of Star Ratings", x = "Star Ratings", y = "Frequency") +
    theme_minimal()
  
  # Visualization for state distribution
  state_plot <- ggplot(data, aes(x = as.factor(state))) +
    geom_bar(fill = "blue", color = "black", alpha = 0.7) +
    labs(title = "Count of Businesses by State", x = "State", y = "Count") +
    theme_minimal()
  
  # Visualization for top categories
  category_counts <- data %>%
    mutate(categories = strsplit(as.character(categories), ", ")) %>%
    unnest(categories) %>%
    count(categories, sort = TRUE)
  
  top_categories <- category_counts %>%
    top_n(20, n) %>%
    arrange(desc(n))
  
  category_plot <- ggplot(top_categories, aes(x = reorder(categories, n), y = n)) +
    geom_bar(stat = "identity", fill = "blue", color = "black", alpha = 0.7) +
    labs(title = "Top 20 Categories", x = "Categories", y = "Count") +
    coord_flip() +
    theme_minimal()
  
  return(list(star_plot = star_plot,
              state_plot = state_plot,
              category_plot = category_plot,
              top_true_attributes = top_true_attributes,
              top_false_attributes = top_false_attributes))
}

## OUTPUT
visualization <- create_visualizations(cleaned_data)

pdf("../../gen/output/data_visualization_graphs.pdf")
create_visualizations(cleaned_data)
dev.off()

write_xlsx(visualization$top_true_attributes, '../../gen/output/data_visualization_TopTrueAttributes.xls')
write_xlsx(visualization$top_false_attributes, '../../gen/output/data_visualization_TopFalseAttributes.xls')
