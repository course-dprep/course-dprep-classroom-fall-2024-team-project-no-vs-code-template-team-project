# Load required packages
library(tidyverse)
library(reshape2)

# Check if 'data' directory exists; if not, create it
if (!dir.exists("data")) {
  dir.create("data")
}

# DOWNLOAD DATA

## Function to download data and save as CSV
download_data <- function(url, filename) {
  download.file(url = url, destfile = paste0(filename, ".csv"))
}

# URLs for the IMDb datasets
urls <- c(
  'https://datasets.imdbws.com/title.basics.tsv.gz',
  'https://datasets.imdbws.com/title.ratings.tsv.gz',
  'https://datasets.imdbws.com/title.episode.tsv.gz'
)

# Use relative paths to save the data in the 'data' directory (relative to the current working directory)
filenames <- c(
  "data/title_basics",
  "data/title_ratings",
  "data/title_episodes"
)

# Download and save each file as CSV
for (i in 1:length(urls)) {
  download_data(urls[i], filenames[i])
}

# Verify the downloaded data
title_basics <- read_delim("data/title_basics.csv", delim = '\t', na = '\\N')
title_ratings <- read_delim("data/title_ratings.csv", delim = '\t', na = '\\N')
title_episodes <- read_delim("data/title_episodes.csv", delim = '\t', na = '\\N')

