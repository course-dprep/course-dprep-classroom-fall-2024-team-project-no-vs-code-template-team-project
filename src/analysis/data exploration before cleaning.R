# Load required packages
library(tidyverse)
library(reshape2)
library(kableExtra)

# Set the working directory to the root of your project
# Uncomment and modify the following line if you need to explicitly set your working directory
# setwd("path/to/your/project")

# Define relative paths for the input and output directories
input_dir <- "data"
output_dir <- "gen/output/before_cleaning"

# Create the output directory if it doesn't exist
if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)
}

# Load datasets from the saved CSV files (use relative paths)
title_basics <- read_delim(file.path(input_dir, "title_basics.csv"), delim = '\t', na = '\\N')
title_ratings <- read_delim(file.path(input_dir, "title_ratings.csv"), delim = '\t', na = '\\N')
title_episodes <- read_delim(file.path(input_dir, "title_episodes.csv"), delim = '\t', na = '\\N')

# PLOT 1: Number of Titles by Adult Content Classification
title_basics_clean <- title_basics %>%
  filter(isAdult %in% c(0, 1))

adult_distribution <- title_basics_clean %>%
  group_by(isAdult) %>%
  summarise(count = n(), .groups = 'drop')

pdf(file = file.path(output_dir, "plot_adult_content_classification.pdf"))
ggplot(adult_distribution, aes(x = factor(isAdult), y = count, fill = factor(isAdult))) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("0" = "blue", "1" = "red"), 
                    labels = c("Non-Adult", "Adult")) +
  ggtitle("Number of Titles by Adult Content Classification") +
  xlab("Adult Content Classification") +
  ylab("Number of Titles") +
  theme_minimal() +
  theme(legend.title = element_blank())
dev.off()

# PLOT 2: Distribution of Average Ratings
pdf(file = file.path(output_dir, "plot_average_ratings_distribution.pdf"))
ggplot(title_ratings, aes(x = averageRating)) +
  geom_histogram(binwidth = 0.5, fill = "blue", color = "black") +
  ggtitle("Distribution of Average Ratings") +
  xlab("Average Rating") +
  ylab("Count") +
  theme_minimal()
dev.off()

# PLOT 3: Number of TV Series per Episode Category
episodes_per_series <- title_episodes %>%
  group_by(parentTconst) %>%
  summarise(episode_count = n(), .groups = 'drop')

episodes_per_series <- episodes_per_series %>%
  mutate(episode_category = cut(episode_count, 
                                breaks = c(0, 5, 10, 20, 50, 100, Inf),
                                labels = c("1-5", "6-10", "11-20", "21-50", "51-100", "100+")))

episode_distribution <- episodes_per_series %>%
  group_by(episode_category) %>%
  summarise(count = n(), .groups = 'drop')

pdf(file = file.path(output_dir, "plot_episode_distribution.pdf"))
ggplot(episode_distribution, aes(x = episode_category, y = count, fill = episode_category)) +
  geom_bar(stat = "identity") +
  ggtitle("Number of TV Series per Episode Category") +
  xlab("Episode Category") +
  ylab("Count") +
  theme_minimal()
dev.off()

# Save adult content table as PDF
pdf(file = file.path(output_dir, "table_adult_content.pdf"))
kable(adult_distribution, caption = "Number of Titles by Adult Content Classification") %>%
  kable_styling()
dev.off()

# Save vote distribution table as PDF
pdf(file = file.path(output_dir, "table_episode_distribution.pdf"))
kable(episode_distribution, caption = "Number of TV Series per Episode Category") %>%
  kable_styling()
dev.off()

