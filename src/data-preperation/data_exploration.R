# Load packages 
library(dplyr)
library(stringr)
library(tidyverse)
library(scales)

# Importing the data set 
data <- read_csv("../../data/data.csv")

#Data Exploration

#Top 10 Actors by Number of Known Titles
# Count the number of known titles for each actor
library(dplyr)

top_actors <- data %>%
  group_by(primaryName) %>%
  summarise(numTitles = n()) %>%
  arrange(desc(numTitles)) %>%
  head(10)

# Display the table
top_actors



# Bar chart of top 10 actors with the most titles
library(ggplot2)
ggplot(top_actors, aes(x = reorder(primaryName, -numTitles), y = numTitles)) +
  geom_bar(stat = "identity", fill = "pink") +
  labs(title = "Top 10 Actors by Number of Known Titles", x = "Actor", y = "Number of Titles") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))



#IMDb Ratings Distribution

# Create a histogram of IMDb ratings
ggplot(data, aes(x = averageRating)) +
  geom_histogram(binwidth = 0.5, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Distribution of IMDb Ratings", x = "Average Rating", y = "Count of Movies") +
  theme_minimal()



# Scatter plot of number of votes vs average rating
ggplot(data, aes(x = numVotes, y = averageRating)) +
  geom_point(alpha = 0.5, color = "red") +
  labs(title = "Number of Votes vs IMDb Ratings", x = "Number of Votes", y = "Average Rating") +
  theme_minimal()


# Distribution of IMDb Ratings by Actor
top_movies <- data %>%
  group_by(tconst) %>%
  arrange(desc(averageRating)) %>%
  head(100)

# Display the table
top_movies

