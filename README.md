# Evaluating the Impact of Number of Episodes on TV Show Ratings
![image](https://cdn.freebiesupply.com/images/large/2x/imdb-logo-transparent.png)

---

### Overview
This project investigates whether there is a correlation between the number of episodes in a TV show and its IMDb rating, providing insights into how show length might influence audience perception.

### Contributors
| Author                | Contact                                     |
|-----------------------|---------------------------------------------|
| **Kanaya Hendra**     | kanayalalityahendra@tilburguniversity.edu   |
| **Owen van Lith**     | o.m.vanlith@tilburguniversity.edu           |
| **Lam Nguyen**        | l.k.l.nguyen@tilburguniversity.edu          |
| **Pepijn Kars**       | p.kars@tilburguniversity.edu                |
| **Jason Ye**          | a.s.ye@tilburguniversity.edu                |

---

## 1. Introduction

### 1.1 Research Motivation
With this research, we aim to explore the factors influencing TV show ratings to provide valuable insights for content creators, streaming platforms, and marketers. Understanding these factors can enhance content strategies, optimize recommendations, and improve user experience. Specifically, this research seeks to determine whether viewers prefer binge-watching shorter series or are more engaged with longer ones, suggesting an ideal number of episodes for a TV show.

### 1.2 Relevance 
This research is relevant because it allows filmmakers and marketers to understand the key factors influencing TV shows ratings, leading to a better benchmarking and decision-making in their marketing strategies. With this information, filmmakers can make better decisions in the number of episodes they are producing. Furthermore, IMDb can improve its recommendation system, offering more personalized movie recommendations, making it easier for users to find movies they will enjoy.

### 1.3 Research Question
Does the number of episodes significantly influence the ratings of TV shows?

---

## 2. Method and results

### 2.1 Data Source 
To begin, we review all available datasets from IMDb's Non-Commercial Datasets to identify those that contain the necessary information for our research. Specifically, we focus on datasets that include TV show titles, identifiers, the number of episodes, and ratings.

### 2.2 Variables
Subsequently, we choose to work with the following variables:

| Dataset       | Variable       | Description                                         |
|---------------|----------------|-----------------------------------------------------|
| title.episode | tconst         | identifier of episode                               |
|               | parentTconst   | identifier of the parent TV Series                  |
|               | seasonNumber   | season number the episode belongs to                |
|               | episodeNumber  | episode number of the tconst in the TV series       |
| title.ratings | tconst         | unique identifier of the title                      |
|               | averageRating  | weighted average of all the individual user ratings |
|               | numVotes       | number of votes the title has received              |
| title.basics  | tconst         | unique identifier of the title                      |
|               | titleType      | the type/format of the title                        |
|               | primaryTitle   | the more popular title                              |
|               | originalTitle  | original title, in the original language            |
|               | isAdult        | 0: non-adult title; 1: adult title                  |
|               | startYear      | the release year of a title                         |
|               | endYear        | TV Series end year                                  |
|               | runtimeMinutes | primary runtime of the title, in minutes            |
|               | genres         | up to three genres associated with the title        |


### 2.3 Research Method
To explore these relationships, regression analysis will be used as the primary research method. This approach is ideal for quantifying the relationship between a dependent variable (TV show ratings) and an independent variable (number of episodes). By applying this method, we can measure how changes in the number of episodes impact ratings and determine the strength of this effect. Regression is especially well-suited for this research question because it reveals both the strength and direction of the relationship between the number of episodes and TV show ratings. It also strengthens the analysis by considering other variables, ensuring that the link between episode count and ratings isn’t influenced by unrelated factors.

### 2.4 Results

---

## 3. Repository overview

```
|-- LICENSE
|-- ProjectVersion1.Rmd
|-- README.html
|-- README.md
|-- team-project-no-vs-code-team-9_dprep.Rproj
|-- teamproject.Rmd
```
---

## 4. Running instructions

*Download and install R and RStudio*: [https://tilburgsciencehub.com/topics/computer-setup/software-installation/rstudio/r/](https://tilburgsciencehub.com/topics/computer-setup/software-installation/rstudio/r/)

*Download and install Git*:[https://tilburgsciencehub.com/topics/automation/version-control/start-git/git/](https://tilburgsciencehub.com/topics/automation/version-control/start-git/git/) 

*Sign up on Github*:[https://github.com/](https://github.com/)

*Install make*:[https://tilburgsciencehub.com/topics/automation/automation-tools/makefiles/make/](https://tilburgsciencehub.com/topics/automation/automation-tools/makefiles/make/)
  
*Access to the datasets at*:

title episode:[https://datasets.imdbws.com/title.episode.tsv.gz](https://datasets.imdbws.com/title.episode.tsv.gz)

title.ratings:[https://datasets.imdbws.com/title.ratings.tsv.gz](https://datasets.imdbws.com/title.ratings.tsv.gz)

title.basics:[https://datasets.imdbws.com/title.basics.tsv.gz](https://datasets.imdbws.com/title.basics.tsv.gz)
  
### Necessary libraries in R

```
library(readr)
library(dplyr)
library(ggplot2)
library(knitr)
library(stringr)
library(car)
library(data.table)
library(readxl)
```

### Installing tinytex to knit the Rmarkdown

```
install.packages('tinytex')
tinytex::install_tinytex()
````


