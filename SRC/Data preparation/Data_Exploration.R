#Data Exploration

options(repos = c(CRAN = "https://cloud.r-project.org"))

library(readr)
library(knitr) 

#This section explores the IMDb datasets and provide an overview of the datasets,the definitions of the variables and figures.

episode <- read_csv("../../data/episode.csv")
ratings <- read_csv("../../data/ratings.csv")
titles <- read_csv("../../data/titles.csv")

#The 'episode' dataset
str(episode)
summary(episode)
knitr::kable(head(episode), caption = "First few rows of 'title.episode' dataset", escape = TRUE)

# Variable Definitions for 'episode'
knitr::kable(
  data.frame(
    Variable = c("tconst", "parentTconst", "seasonNumber", "episodeNumber"),
    Definition = c("Unique identifier for the title", 
                   "Identifier of the parent title (e.g., the series for an episode)", 
                   "Season number of the episode", 
                   "Episode number in the seasons")
    
  ),
  caption = "Variable Definitions for 'title.episode' Dataset", escape = TRUE
)

#A boxplot of the number of episodes
boxplot(episode$episodeNumber, main = "Boxplot of the number of episodes")


# The 'title.ratings' dataset
str(ratings)
summary(ratings)
knitr::kable(head(ratings), caption = "First few rows of 'title.ratings' dataset", escape = TRUE)

# Variable Definitions for 'title.ratings'
knitr::kable(
  data.frame(
    Variable = c("tconst", "averageRating", "numVotes"),
    Definition = c("Unique identifier for the title", 
                   "Average rating of the title", 
                   "Number of votes received for the title")
  ),
  caption = "Variable Definitions for 'title.ratings' Dataset", escape = TRUE
)

#Boxplot of the average ratings
boxplot(ratings$averageRating, main = "Boxplot of the average ratings")

# The 'title.basics' dataset
str(titles)
summary(titles)
knitr::kable(head(titles), caption = "First few rows of 'titles' dataset", escape = TRUE)

# Variable Definitions for 'titles'
knitr::kable(
  data.frame(
    Variable = c("tconst", "titleType", "primaryTitle", "originalTitle", "isAdult", "startYear", "endYear", "runtimeMinutes", "genres"),
    Definition = c("Unique identifier for the title", 
                   "Type of the title (e.g., movie, short, TV episode)", 
                   "Primary title of the work", 
                   "Original title of the work", 
                   "Adult content flag (0: non-adult, 1: adult)", 
                   "Release year or start year for series", 
                   "End year for series", 
                   "Runtime in minutes", 
                   "Genres associated with the title")
  ),
  caption = "Variable Definitions for 'titles' Dataset", escape = TRUE
)
