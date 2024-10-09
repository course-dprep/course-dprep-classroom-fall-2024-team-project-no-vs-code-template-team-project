# How actors influence the IMDb popularity ratings of a movie
## Introduction
The film industry is a multi-billion-dollar industry, and a film’s success is influenced by various factors such as genre, script, marketing, and, notably, the cast. The question of whether actors influence a movie’s IMDb popularity is particularly relevant in today’s digital landscape, where user-driven platforms, such as IMDb, influence the perception and amount of viewers for a movie. This research will explore whether the same effect translates to IMDb ratings, which are seen as a key indicator of a movie’s popularity globally. Extensive research exists on the determinants of box office success, such as genre and budget, but the specific influence of actors on IMDb ratings is underexplored. This research will address this gap and offer insights into digital consumer behavior and the entertainment industry by examining the following question:

**“Does an actor influence the IMDb popularity ratings of a movie?”**

## Research Motivation
Casting A-list actors is a strategic move often aimed at boosting a film’s visibility and its financial and commercial success. Casting announcements featuring major stars have been found to positively affect market expectations, sometimes adding millions in predicted box office revenues (Elberse, 2017). Recognizable stars, particularly those who have won prestigious awards like Oscars, can draw larger audiences and increase the movie’s box office performance (Kim et al., 2021). Understanding this relationship can provide insights into the Return on Investment of casting famous actors, which could help guide production and marketing decisions.

Actors with significant public followings may not only impact box office returns but also audience-driven rating platforms like IMDb (Nelson & GLotfelty, 2012). IMDb ratings influence not only the perception of films but also consumer behavior, particularly on streaming platforms where these ratings shape recommendations. If a strong correlation between actors and IMDb ratings is identified, studios could adjust their marketing strategies to star-driven campaigns. From a consumer behavior perspective, IMDb ratings often guide viewers’ choices, and well-known actors may function as a heuristic that leads audiences to rate movies higher, reflecting how people rely on easily accessible cues to make decisions. Researching the question “Does an actor influence the IMDb popularity ratings of a movie?” offers valuable insights into both film industry dynamics and consumer behavior.
#### Sources
- Elberse, Anita. "The Power of Stars: Do Star Actors Drive the Success of Movies?" Journal of Marketing 71, no. 4 (October 2007): 102–120. Featured in HBS Working Knowledge.
- Kim, A., Trimi, S., and Lee, S.G. "Exploring the Key Success Factors of Films: A Survival Analysis Approach." Service Business 15 (2021): 613–638. https://doi.org/10.1007/s11628-021-00460-x.
- Nelson, R.A., and Glotfelty, R. "Movie Stars and Box Office Revenues: An Empirical Analysis." Journal of Cultural Economics 36 (2012): 141–166. https://doi.org/10.1007/s10824-012-9159-5.

## Research Method
To investigate whether an actor influences the IMDb popularity ratings of a movie, we have decided to run a multiple linear regression. We chose this regression because the dependent variable, the movie’s *IMDb averageRating*, is continuous. The goal is to assess how much an actor’s presence influences a movie’s IMDb score while controlling for other variables like the movie's number of votes (numVotes) and other potential confounders. This model can quantify the extent to which actors impact the IMDb ratings, adjusting for other movie-specific factors. 

Model Structure:
In this model, the actor's influence will be captured using the nconst variable, which uniquely identifies each actor in the dataset. Actor-related characteristics like their *primaryName* (name by which they are most often credited), *primaryProfession*, and the movies they are known for (knownForTitles) will be linked to the IMDb *tconst* (unique title identifier) for the movies they participated in. The movie's averageRating will serve as the dependent variable.
To measure an actor’s influence on a movie’s IMDb score, we can use their *nconst* to link actors to specific movies via *knownForTitles*. Actors with higher recognition or fame, as reflected by the number of films they are associated with or their prominence in the *primaryProfession* (e.g., lead actor, director), may influence the IMDb ratings of the movies they are in.
The number of movies an actor is known for (knownForTitles), can be used to assess how an actor’s filmography affects a movie's popularity. An actor with a rich filmography might bring more visibility or audience interest, potentially resulting in a higher *averageRating*.

Control Variables:
NumVotes (Popularity Measure): The number of votes a movie receives (numVotes) can be an indicator of its visibility and popularity. Since more popular movies often have higher ratings, controlling for numVotes ensures that the analysis focuses on the actor's influence on the averageRating rather than how well-known the movie is.

| Variable            | Description                     
|---------------------|:-------------------------------------------------------
| tconst              | Unique title identifier         
| averagRating        | Weighted average rating of all individual user ratings
| numVotes            | NUmber of votes a title has received 
| l.x                 | ???  
| primaryTitle        | Unique title identifier         
| startYear           | Weighted average rating of all individual user ratings
| genre               | Number of votes a title has received 
| l.y                 | ???  
| primaryName         | Unique title identifier         
| primaryProfession   | Weighted average rating of all individual user ratings
| actorExperience     | Number of movies an actor has been in


## Results
The results of the analyses performed in this research confirm...

## Repository Overview
```
├── data
   └── .gitignore
├── gen
   ├── data-analysis/output
       └──.gitignore
   └── data-preparation/output
       └──.gitignore
├── src
   ├── analysis
       ├── analyse.R
       ├── data_analysis.Rmd
       └── makefile
   └── paper
       ├── .gitignore
       ├── Rplots.pdf
       ├── clean_dataR
       ├── data_exploration.R
       ├── data_exploration.Rmd
       ├── download_data.R
       ├── filter.R
       ├── makefile
       ├── merge_data.R
       ├── remove_variables.R
       └── render.R
├── LICENSE
├── README.md
├── makefile
├── Team5Dprep.Rmd
├── Team5Dprep.pdf
```

## Dependencies

Please follow the installation guides on http://tilburgsciencehub.com/.

- R. [Installation guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/).
- Make. [Installation guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/).
- Pandoc. [Installation guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/pandoc/)

- For R, make sure you have installed the following packages:
```
install.packages("tidyverse")
install.packages("dplyr")
install.packages("stringr")
install.packages("scales")
install.packages("ggplot2")
install.packages("data.table")
install.packages("rmarkdown")
install.packages("forcats")
```
## Running Instructions
#### **Running The Code By Make**
To run the code, follow these instructions:
1. Fork this repository
2. Open your command line/terminal and run the following code:
```
git clone https://github.com/course-dprep/MovieGenre_IMDbAnalysis
```
3. Set your working directory to `MovieGenreIMDbAnalysis` and run the following command:
```
make
```
4. When make has successfully run all the code, it will generate multiple graphs with the presentation of our analysis. 
5. To clean the data of all raw and unnecessary data files created during the pipeline, run the following code in the command line/terminal: 
```
make clean
```

## Authors
- Eveline Cai, e-mail: r.t.cai@tilburguniversity.edu  
- Sophie van Hest, e-mail: s.f.a.vanhest@tilburguniversity.edu  
- Mette Swanenberg, e-mail: m.j.t.swanenberg@tilburguniversity.edu  
- Tyamo van der Ceelen, e-mail: t.p.a.vdrceelen@tilburguniversity.edu  

