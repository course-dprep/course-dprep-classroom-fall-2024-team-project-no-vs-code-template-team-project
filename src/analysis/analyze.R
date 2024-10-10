## Initial Analyses

library(dplyr)

# Importing the data set 
data <- read_csv("../../data/data.csv")

#Create control variable actorExperience: the number of movies an actor has been involved in

data <- data %>%
  group_by(primaryName) %>%
  mutate(actorExperience = n()) %>%
  ungroup()


#As R is running out of memory while trying to handle a large computation, likely due to the size and structure of our dataset we made a few changes.
#Only include actors with at least 10 movies:

data_filtered <- data %>%
  filter(actorExperience >= 10)

#Only include movies with at least 100 number of votes:

data_filtered <- data_filtered %>%
  filter(numVotes >= 50000)

#Keep the top 5 genres, lump the other genres into 'other'. 

#install.packages("forcats")
library(forcats)
data_filtered$genre <- fct_lump(data_filtered$genre, n = 5)

#We reduced the magnitude of the startYear variable by grouping it into 10-year intervals (decades)

data_filtered$startYear <- as.numeric(data_filtered$startYear)
data_filtered$startYear_decade <- (data_filtered$startYear %/% 10) * 10


#Prepare dummy variables for genre, primaryName and startYear. We also drop all the rows that are missing the average Rating.

data_filtered <- data_filtered %>%
  mutate(genre = factor(genre), primaryName = factor(primaryName), startYear_decade = factor(startYear_decade)) %>%
  tidyr::drop_na(averageRating)





summary(lm(averageRating ~ actorExperience + numVotes + genre + startYear_decade, data = data_filtered))

