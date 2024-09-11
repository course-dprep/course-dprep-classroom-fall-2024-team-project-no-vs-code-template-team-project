---
title: "README"
output: pdf_document
date: "2024-09-10"
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Research Question

Does the length of a TV show affect the average rating of a TV show episodes in a positive or negative way?

# Research Method

The chosen research method for the mentioned research question is a regression analysis. This research method will be suitable to investigate the relation between the variables, the length of a TV show and the episode ratings. Performing a regression analysis allows us to determine if the length of a TV show significantly affects the ratings of its episodes and to learn more about the direction of the relationship.

To perform the regression analysis we will make use of the following data sets: 1. title.episode.tsv.gz a. To find the series and the episodes 2. title.ratings.tsv.gz a. Average rating of individual users combined 3. title.basics.tsv.gz a. Genre for cross reference

# Way of Deployment

The chosen way of deployment will be a PDF report. This was chosen to make a structured layout and to ensure consistency over multiple devices and platforms.

# Workflow

The following workflow will be performed in this research to ensure an automated and reproducible workflow: 1. Data exploration 2. Data preperation 3. Analysis 4. Evaluation and deployment

# Data Extraction

Below you will find the code used to extract the information from: IMDb Data Files Download (imdbws.com).

```{r Data Extraction, message=FALSE, warning=FALSE}
library(here)
library(readr)

# Create a relative data directory
if (!dir.exists(here("Data"))) {
  dir.create(here("Data"))
}

# Define file paths for saving data 
ratings_path <- here("Data", "rating.tsv.gz")
basics_path  <- here("Data", "basics.tsv.gz")
episode_path <- here("Data", "episode.tsv.gz")

# Download data files
download.file("https://datasets.imdbws.com/title.ratings.tsv.gz", ratings_path)
download.file("https://datasets.imdbws.com/title.basics.tsv.gz", basics_path)
download.file("https://datasets.imdbws.com/title.episode.tsv.gz", episode_path)

# Reading the compressed files directly
Ratings_Data <- read_delim(gzfile(ratings_path), delim = "\t")
Genre_Data   <- read_delim(gzfile(basics_path), delim = "\t")
Episode_Data <- read_delim(gzfile(episode_path), delim = "\t")

#Previewing the data
summary(Ratings_Data)
summary(Genre_Data)
summary(Episode_Data)
```

# Explaining variables per variable dataset

Below you will find the variable names and variable descriptions per dataset.

## Ratings Dataset

| Variable Name   | Variable Description                                |
|-----------------|-----------------------------------------------------|
| tconst (string) | Alphanumeric unique identifier of the title         |
| averageRating   | Weighted average of all the individual user ratings |
| numVotes        | Number of votes the title has received              |

## Genre Dataset

| Variable Name          | Variable Description                                                                                       |
|------------------------|------------------------------------------------------------------------------------------------------------|
| tconst (string)        | Alphanumeric unique identifier of the title                                                                |
| titleType (string)     | The type/format of the title (e.g. movie, short, tvseries, tvepisode, video, etc)                          |
| primaryTitle (string)  | The more popular title / the title used by the filmmakers on promotional materials at the point of release |
| originalTitle (string) | Original title, in the original language                                                                   |
| isAdult (boolean)      | 0: non-adult title; 1: adult title                                                                         |
| startYear (YYYY)       | Represents the release year of a title. In the case of TV Series, it is the series start year              |
| endYear (YYYY)         | TV Series end year. ‘\\N’ for all other title types                                                        |
| runtimeMinutes         | Primary runtime of the title, in minutes                                                                   |
| genres (string array)  | Includes up to three genres associated with the title                                                      |

## Episode dataset

| Variable Name           | Variable Description                            |
|-------------------------|-------------------------------------------------|
| tconst (string)         | Alphanumeric identifier of episode              |
| parentTconst (string)   | Alphanumeric identifier of the parent TV Series |
| seasonNumber (integer)  | Season number the episode belongs to            |
| episodeNumber (integer) | Episode number of the tconst in the TV series   |
