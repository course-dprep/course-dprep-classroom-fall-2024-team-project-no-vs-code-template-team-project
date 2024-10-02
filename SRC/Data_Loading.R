#Loading Data


# Install packages

install.packages("readr")
install.packages("dplyr")   
install.packages("ggplot2")   
install.packages("stringr")
install.packages("car")         
install.packages("data.table")
install.packages("readxl")

# Open libraries

library(readr)
library(dplyr)
library(ggplot2)
library(stringr)
library(car)
library(data.table)
library(readxl)


#Create a folder for the data
dir.create('../../data')

# Loading the datasets

urls = c('https://datasets.imdbws.com/title.episode.tsv.gz',
         'https://datasets.imdbws.com/title.ratings.tsv.gz',
         'https://datasets.imdbws.com/title.basics.tsv.gz')

datasets <- lapply(urls, read_delim, delim='\t', na = '\\N')
episode <- datasets[[1]]
ratings = datasets[[2]]
titles <- datasets[[3]]

write_csv(episode, "../../data/episode.csv")
write_csv(ratings, "../../data/ratings.csv")
write_csv(titles, "../../data/titles.csv")
