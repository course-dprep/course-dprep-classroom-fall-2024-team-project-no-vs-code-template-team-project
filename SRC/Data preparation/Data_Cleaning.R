#Loading the data

options(repos = c(CRAN = "https://cloud.r-project.org"))
library(readr)
library(dplyr)

#Data cleaning

dir.create('../../output')

episode <- read_csv("../../data/episode.csv")
ratings <- read_csv("../../data/ratings.csv")
titles <- read_csv("../../data/titles.csv")

#Cleaning the episode dataset
episode = episode %>% filter(!is.na(episodeNumber))
episode = episode %>% rename("Number of the season" = "seasonNumber", "Number of episodes" = "episodeNumber")

#Cleaning the ratings dataset
ratings = ratings %>% filter(!is.na(averageRating)) %>% rename("The average rating" = "averageRating", "Amount of votes" = "numVotes")

#Cleaning the titles dataset
titles = titles %>% filter(titleType == "tvEpisode") 
#Renaming the headers?!?!?!

#Merging the datasets
test = right_join(episode, ratings, by = "tconst")
IMDb_dt = inner_join(test, titles, by = "tconst")

#Creating new variables
IMDb_dt <-  IMDb_dt %>% mutate(popularity = ifelse(`Amount of votes` > 1000, 1, 0))
IMDb_dt <- IMDb_dt %>% mutate(runtime = ifelse(runtimeMinutes > 50, "long", "short"))
IMDb_dt <- IMDb_dt %>% mutate(new_vs_old = ifelse(startYear > 2015, "new", "old"))
IMDb_dt <- IMDb_dt %>% mutate(episode_quantity = ifelse(`Number of episodes` > 25, "Many", "Few"))

write_csv(IMDb_dt, "../../output/IMDb_dt.csv")
