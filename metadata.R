## Research question
# Does the number of episodes significantly influence the ratings of TV shows?

## Research Motivation
# This research question is relevant because it allows filmmakers and marketers to understand the key factors influencing TV shows ratings, leading to a better benchmarking and decision-making in their marketing strategies. With this information, filmmakers can make better decisions in the number of episodes they are producing. Furthermore, IMDb can improve its recommendation system, offering more personalized movie recommendations, making it easier for users to find movies they will enjoy.

# The appropriate method for this research is a multiple regression analysis. The multiple regression analysis shows how several independent variables influence the dependent variable. Additionally the multiple regression is convenient to interpret. With this type of analysis it can be determined how much each independent variable influences the dependent variable ratings and which independent variable influences the ratings most significantly.

# 2. Data preparation & analysis
## 2.1 Data exploration

#This section explores the IMDb datasets and provide an overview of the datasets, the definitions of the variables and figures.

library(readr)
library(dplyr)
library(ggplot2)
library(knitr)
library(stringr)
library(car)
library(data.table)
library(readxl)
setwd("C:/Users/Jason/Documents/Data prep/team-project-no-vs-code-team-9_dprep")

urls = c('https://datasets.imdbws.com/title.episode.tsv.gz', 'https://datasets.imdbws.com/title.ratings.tsv.gz')

datasets <- lapply(urls, read_delim, delim='\t', na = '\\N')
episode <- datasets[[1]]
ratings <- datasets[[2]]

ratings

