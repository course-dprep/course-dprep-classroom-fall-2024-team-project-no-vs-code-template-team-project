# Load required packages
library(tidyverse)

# Define relative paths for input and output directories
input_dir <- "gen/temp"  # Relative path to the cleaned merged data
output_dir <- "gen/output/after_cleaning"  # Relative path for the output directory

# Create output directory if it doesn't exist
if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)
}

# Load the merged dataset (use relative path)
merged_data <- read_csv(file.path(input_dir, "cleaned_merged_tvseries.csv"))

# Plot 1: Scatterplot - Number of Episodes vs. Average Rating
pdf(file = file.path(output_dir, "scatterplot_episodes_vs_rating.pdf"))
ggplot(merged_data, aes(x = episode_count, y = averageRating, color = as.factor(isAdult))) +
  geom_point(alpha = 0.6) +
  scale_color_manual(values = c("0" = "blue", "1" = "red"), labels = c("Non-Adult", "Adult")) +
  labs(
    title = "Number of Episodes vs. Average Rating",
    x = "Number of Episodes",
    y = "Average Rating",
    color = "Adult Content"
  ) +
  theme_minimal()
dev.off()

# Plot 2: Boxplot - Average Rating by Adult Content (Faceted by Episode Count Categories)
pdf(file = file.path(output_dir, "boxplot_rating_by_adult_content_with_episode_labels.pdf"))
ggplot(merged_data, aes(x = as.factor(isAdult), y = averageRating, fill = as.factor(isAdult))) +
  geom_boxplot() +
  scale_fill_manual(values = c("0" = "blue", "1" = "red"), labels = c("Non-Adult", "Adult")) +
  labs(
    title = "Average Rating by Adult Content",
    x = "Adult Content",
    y = "Average Rating",
    fill = "Adult Content"
  ) +
  theme_minimal() +
  facet_wrap(~ cut(episode_count, 
                   breaks = c(0, 10, 50, 100, Inf), 
                   labels = c("0-10 episodes", "11-50 episodes", "51-100 episodes", "100+ episodes"))) +
  theme(strip.text = element_text(size = 12, face = "bold"))  # Make facet labels stand out
dev.off()


