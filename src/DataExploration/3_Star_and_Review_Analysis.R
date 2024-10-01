## SETUP
library(readr)
library(data.table)
library(dplyr)
library(grid)
library(gridExtra)

## INPUT
cleaned_data <- read_csv('../../data/cleaned_data_for_exploration.csv')
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
              round(mean(data$stars, na.rm = TRUE), 2)))
  
  # Summary statistics for review counts
  review_summary <- data.frame(
    Statistic = c("Mean Review Count", "Median Review Count", 
                  "Min Review Count", "Max Review Count"),
    Value = c(mean(data$review_count, na.rm = TRUE),
              median(data$review_count, na.rm = TRUE),
              min(data$review_count, na.rm = TRUE),
              max(data$review_count, na.rm = TRUE)))
  
  # Calculate quartiles
  quartile_boundaries <- quantile(data$review_count, probs = 0:4/4, na.rm = TRUE)
  data$quartile <- cut(data$review_count,
                       breaks = quartile_boundaries,
                       include.lowest = TRUE,
                       labels = c("1st Quartile", "2nd Quartile", "3rd Quartile", "4th Quartile"))
  
  return(list(star_summary = star_summary, 
              review_summary = review_summary,
              data = data))
}
analyzed_data <- analyze_data(cleaned_data)
star_summary <- analyzed_data$star_summary
review_summary <- analyzed_data$review_summary

## OUTPUT
pdf('../../gen/output/star_and_review_summary.pdf')
grid.table(star_summary)
grid.newpage()
grid.table(review_summary) 
dev.off()

