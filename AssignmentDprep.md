## Research Motivation

The relationship between the number of episodes a TV show is set to have
and its average rating is a crucial yet insufficiently studied area in
the field of media research. Since competition among streaming platforms
and TV networks is rising, uncovering and understanding any factor that
may influence TV show rating is paramount for optimizing content.
Moreover, as adult shows may benefit from having more episodes due to
possibly having more complex or mature story lines, researching whether
the effect of episode count on ratings differ for this genre offers
additional value to this research. This study therefore aims to answer
the question: "To what extent does the number of a TV show's episodes
impact its average rating, and does this differ between adult titles and
non-adult titles?" The insights gained from this research could assist
producers in making more informed decisions with regards to episode
count when creating content.

A multiple linear regression will be the applied research method, with
average show rating as the dependent variable. The independent variables
will consist of the continuous variable "number of episodes", as well as
the dummy variable "adult title" (with 1 for adult shows, 0 for
non-adult shows). By including the interaction term episodesXadult, we
can also assess a potential difference in effect between adult versus
non-adult movies. This linear regression method effectively addresses
the objective of this research as it quantifies the impact of episode
count ratings while also allowing an interaction term to assess whether
this effect differs for the adult genre.

## Data exploration


This report provides an overview of the 3 IMDb datasets that we are
using in our research. We explore the raw data files and explain the
variables to understand the structure and content of the data.

The following packages are required for this project:
```{r,  message=FALSE, warning=FALSE}
library(tidyr)
library(dplyr)
library(readr)
library(knitr)
library(ggplot2)
library(kableExtra)
```


### Load the data files


Load the 'title basics', 'title ratings' & 'title episode' datasets.
```{r, echo=FALSE, message=FALSE, warning=FALSE}

urls <- c(
  'https://datasets.imdbws.com/title.basics.tsv.gz',
  'https://datasets.imdbws.com/title.ratings.tsv.gz',
  'https://datasets.imdbws.com/title.episode.tsv.gz'
)


filenames <- c(
  'title.basics.tsv.gz',
  'title.ratings.tsv.gz',
  'title.episode.tsv.gz'
)


for (i in 1:length(urls)) {
  download.file(urls[i], filenames[i])
}


title_basics <- read_delim('title.basics.tsv.gz', delim = '\t', na = '\\N')
title_ratings <- read_delim('title.ratings.tsv.gz', delim = '\t', na = '\\N')
title_episodes <- read_delim('title.episode.tsv.gz', delim = '\t', na = '\\N')

```


### Explanation of the data files


#### title.basics.tsv.gz


This file contains basic information about the titles from the movies and TV shows in the IMDb database.


```{r, echo=FALSE, message=FALSE, warning=FALSE}


basics_vars <- data.frame(
  Variable = c("tconst", "titleType", "primaryTitle", "originalTitle", 
               "isAdult", "startYear", "endYear", "runtimeMinutes", "genres"),
  Description = c("Alphanumeric unique identifier of the title.",
                  "Type of title (e.g., movie, short, tvseries, tvepisode).",
                  "The most popular title at the time of release.",
                  "Title in the original language.",
                  "Indicates whether the title is adult content (0: No, 1: Yes).",
                  "The year the title was first released.",
                  "The year the title ended (NA for non-series).",
                  "Runtime of the title in minutes.",
                  "Includes up to three genres associated with the title.")
)

kable(basics_vars, caption = "Variables in title.basics")
```


View the first rows of the data.
```{r, echo=FALSE, message=FALSE, warning=FALSE}
head(title_basics)
```


```{r, echo=FALSE, message=FALSE, warning=FALSE, fig.cap="Figure 1: Distribution of Genres"}
title_genres <- title_basics %>%
  separate_rows(genres, sep = ",") %>%
  filter(!is.na(genres)) %>%
  group_by(genres) %>%
  summarise(count = n(), .groups = 'drop')


ggplot(title_genres, aes(x = reorder(genres, -count), y = count)) +
  geom_bar(stat = "identity", fill = "blue", color = "black") +
  coord_flip() + 
  ggtitle("Distribution of Genres") +
  xlab("Genres") +
  ylab("Count") +
  theme_minimal()
```

Figure 1 shows in what sizes the titles are distributed among the different genres, clearly drama and comedy are the most common.


```{r, echo=FALSE, message=FALSE, warning=FALSE, fig.cap="Figure 2: Number of Titles by Adult Content Classification"}

title_basics_clean <- title_basics %>%
  filter(isAdult %in% c(0, 1))


adult_distribution <- title_basics_clean %>%
  group_by(isAdult) %>%
  summarise(count = n(), .groups = 'drop')


ggplot(adult_distribution, aes(x = factor(isAdult), y = count, fill = factor(isAdult))) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("0" = "blue", "1" = "red"), 
                    labels = c("Non-Adult", "Adult")) +
  ggtitle("Number of Titles by Adult Content Classification") +
  xlab("Adult Content Classification") +
  ylab("Number of Titles") +
  theme_minimal() +
  theme(legend.title = element_blank())


```

Figure 2 shows us a difference between does contain “is adult” and does not contain “is adult” titles. The vast majority of titles are not only for adults. More than 10 million titles dont have the  'is adult' stamp, on the other hand there are around 350,000 titles that do contain the 'is adult' stamp.



#### title.ratings.tsv.gz

This file contains user ratings and the number of votes for each title.

```{r, echo=FALSE, message=FALSE, warning=FALSE}
ratings_vars <- data.frame(
  Variable = c("tconst", "averageRating", "numVotes"),
  Description = c("Alphanumeric unique identifier of the title.",
                  "Weighted average of all user ratings.",
                  "Number of votes the title has received.")
)

kable(ratings_vars, caption = "Variables in title.ratings")
```



View the first rows of the data
```{r, echo=FALSE, message=FALSE, warning=FALSE}
head(title_ratings)
```

Analyse the data

```{r, echo=FALSE, message=FALSE, warning=FALSE, fig.cap="Figure 3: Distribution of Average Ratings"}
ggplot(title_ratings, aes(x = averageRating)) +
  geom_histogram(binwidth = 0.5, fill = "blue", color = "black") +
  ggtitle("Distribution of Average Ratings") +
  xlab("Average Rating") +
  ylab("Count") +
  theme_minimal()
```
Figure 3 shows the distribution of ratings for the te titels, the highest frequency takes place between grades 6.0 and 8.0 with a peak around 7.5. Furthermore, there are fewer lower ratings for the titels.


```{r, echo=FALSE, message=FALSE, warning=FALSE}
title_ratings <- title_ratings %>%
  mutate(vote_category = cut(numVotes, 
                             breaks = c(0, 100, 1000, 10000, 50000, 100000, Inf),
                             labels = c("0-100", "101-1,000", "1,001-10,000", 
                                        "10,001-50,000", "50,001-100,000", "100,001+")))


vote_distribution <- title_ratings %>%
  group_by(vote_category) %>%
  summarise(count = n(), .groups = 'drop')


kable(vote_distribution, caption = "Table 1: Number of Titles per Voting Category") %>%
  kable_styling(bootstrap_options = c("striped", "hover"), full_width = F)
```

Table 1 shows how many votes the titles received. The majority has less then 100 votes, there are about 5000 titels with more then 50.000 votes.


#### title.episode.tsv.gz

This file contains information about TV show episodes.

```{r, echo=FALSE, message=FALSE, warning=FALSE}
episode_vars <- data.frame(
  Variable = c("tconst", "parentTconst", "seasonNumber", "episodeNumber"),
  Description = c("Alphanumeric identifier of the episode.",
                  "Identifier of the parent TV series.",
                  "The season number the episode belongs to.",
                  "The episode number within the season.")
)

kable(episode_vars, caption = "Variables in title.episode")
```


View the first rows of the data
```{r, echo=FALSE, message=FALSE, warning=FALSE}
head(title_episodes)
```

```{r, echo=FALSE, message=FALSE, warning=FALSE}
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


kable(episode_distribution, caption = "Table 2: Number of TV Series per Episode Category")
```

```{r, echo=FALSE, message=FALSE, warning=FALSE}

summary_stats_episodes <- episodes_per_series %>%
  summarise(
    `Minimum` = min(episode_count),
    `Maximum` = max(episode_count),
    `Mean` = round(mean(episode_count), 2),  
    `Median` = median(episode_count)
  )


kable(summary_stats_episodes, caption = "Table 3: Summary Statistics for Number of Episodes per TV Series") %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed"), full_width = F)
```

Tables 2 and 3 give us clarity on how many episodes the TV series have. The dataset contains a maximum number of episodes of 18593 and the average number of episodes per TV series is 8.


### References
IMDb Datasets: https://developer.imdb.com/non-commercial-datasets/ 
