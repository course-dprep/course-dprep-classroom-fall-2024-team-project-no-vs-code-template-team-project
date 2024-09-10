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

First download required packages
```{r, echo=FALSE, message=FALSE, warning=FALSE}
library(dplyr)
library(readr)
library(knitr)
library(ggplot2)
```

### Load the data files

Load the 'title basics', 'title ratings' & 'title episode' datasets
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


kable(basics_vars, caption = "Variables in title.basics.tsv.gz")
```


View the first rows and the structure of the data
```{r, echo=FALSE, message=FALSE, warning=FALSE}
head(title_basics)
str(title_basics)
```

```{r, echo=FALSE, message=FALSE, warning=FALSE}

```


#### title.ratings.tsv.gz
This file contains user ratings and the number of votes for each title.

```{r, echo=FALSE, message=FALSE, warning=FALSE}
ratings_vars <- data.frame(
  Variable = c("tconst", "averageRating", "numVotes"),
  Description = c("Alphanumeric unique identifier of the title.",
                  "Weighted average of all user ratings.",
                  "Number of votes the title has received.")
)


kable(ratings_vars, caption = "Variables in title.ratings.tsv.gz")
```



View the first rows and the structure of the data
```{r, echo=FALSE, message=FALSE, warning=FALSE}
head(title_ratings)
str(title_ratings)
```

```{r, echo=FALSE, message=FALSE, warning=FALSE}

```




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

kable(episode_vars, caption = "Variables in title.episode.tsv.gz")
```


View the first rows and the structure of the data
```{r, echo=FALSE, message=FALSE, warning=FALSE}
head(title_episodes)
str(title_episodes)
```

```{r, echo=FALSE, message=FALSE, warning=FALSE}


```



### References
IMDb Datasets: https://developer.imdb.com/non-commercial-datasets/ 

