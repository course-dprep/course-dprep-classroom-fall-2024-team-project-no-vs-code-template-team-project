## SETUP
library(readr)
library(data.table)
library(dplyr)
library(ggplot2)
library(tidyr)
library(gridExtra)

## INPUT
cleaned_data <- read_csv('../../data/cleaned_data_for_exploration.csv')
setDT(cleaned_data)

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
              category_counts = category_counts,
              top_categories = top_categories))
}
visualization <- create_visualizations(cleaned_data)
top_20_categories <- visualization$category_counts %>% top_n(20, n) 
## OUTPUT
pdf("../../gen/output/data_visualization_graphs.pdf")
visualization
dev.off()

pdf('../../gen/output/top_20_categories.pdf')
grid.table(top_20_categories)
dev.off()