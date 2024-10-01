# Load required packages
library(tidyverse)

# Set relative paths for input and output
input_dir <- "data"  # Data directory, relative to the working directory
output_dir <- "gen/temp"  # Output directory, relative to the working directory

# Create the output directory if it doesn't exist
if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)
}

# Load datasets from the data directory using relative paths
title_basics <- read_delim(file.path(input_dir, "title_basics.csv"), delim = '\t', na = '\\N')
title_ratings <- read_delim(file.path(input_dir, "title_ratings.csv"), delim = '\t', na = '\\N')
title_episodes <- read_delim(file.path(input_dir, "title_episodes.csv"), delim = '\t', na = '\\N')


# Cleaning and transformation

# Filter for TV series and select relevant columns
tvseries <- title_basics %>%
  filter(titleType == "tvSeries") %>%
  select(tconst, primaryTitle, isAdult) %>%
  drop_na()  # Remove rows with missing values

# Summarize episode counts and rename column for merging
episode_counts <- title_episodes %>%
  group_by(parentTconst) %>%
  summarise(episode_count = n()) %>%
  rename(tconst = parentTconst) %>%
  drop_na()  # Remove rows with missing values

# Filter ratings for titles with at least 25 votes
title_ratings_clean <- title_ratings %>%
  select(tconst, averageRating, numVotes) %>%
  filter(numVotes >= 25) %>%
  drop_na()  # Remove rows with missing values

# Merge datasets

# Merge TV series with episode counts
tvseries_with_episodes <- tvseries %>%
  inner_join(episode_counts, by = "tconst")

# Merge the resulting dataset with title ratings
tv_series_with_ratings <- tvseries_with_episodes %>%
  inner_join(title_ratings_clean, by = "tconst")

# Save the merged data to the temp directory
write_csv(tv_series_with_ratings, file.path(output_dir, "cleaned_merged_tvseries.csv"))

