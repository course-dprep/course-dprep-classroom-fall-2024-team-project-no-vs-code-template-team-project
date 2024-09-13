# Is an individual’s fame related to his/her birth year?
## Introduction
Is there a significant difference in the IMDb popularity scores among different movie genres? A film producer should perhaps consider producing an action genre movie rather than a thriller genre movie, despite that producer's preference for thriller. What other mediators could affect this effect? Some things that will be further explored and analyzed in this research. 

## Research Motivation
research-question-motivation
The film industry is a multi-billion-dollar industry, and a film’s success is influenced by various factors such as genre, script, marketing, and, notably, the cast. The question of whether actors influence a movie’s IMDb popularity is particularly relevant in today’s digital landscape, where user-driven platforms, such as IMDb, influence the perception and amount of viewers for a movie. 
Casting A-list actors is a strategic move often aimed at boosting a film’s visibility and it’s financial and commercial success. Casting announcements featuring major stars have been found to positively affect market expectations, sometimes adding millions in predicted box office revenues (Elberse, Anita. "The Power of Stars: Do Star Actors Drive the Success of Movies?" Journal of Marketing 71, no. 4 (October 2007): 102–120. (Featured in HBS Working Knowledge.)). Recognizable stars, particularly those who have won prestigious awards like Oscars, can draw larger audiences and increase the movie’s box office performance (Kim, A., Trimi, S. & Lee, SG. Exploring the key success factors of films: a survival analysis approach. Serv Bus 15, 613–638 (2021). https://doi.org/10.1007/s11628-021-00460-x). This research will explore whether the same effect translates to IMDb ratings, which are seen as a key indicator of a movie’s popularity globally. Understanding this relationship can provide insights into the Return on Investment of casting famous actors, which could help guide production and marketing decisions.
IMDb ratings are seen more and more as an indicator for a movie’s popularity and relevance. Actors with significant public following may not only impact box office returns, but also audience-driven rating platforms like IMDb (Nelson, R.A., Glotfelty, R. Movie stars and box office revenues: an empirical analysis. J Cult Econ 36, 141–166 (2012). https://doi.org/10.1007/s10824-012-9159-5). IMDb ratings do not only influence the perception of films, but also consumer behavior, particularly on streaming platforms where these ratings shape the recommendations. If a strong correlation between actors and IMDb ratings is identified, studios could adjust their marketing strategies to star-driven campaigns. 
Extensive research exists on the determinants of box office success, such as genre and budget, but the specific influence of actors on IMDb ratings is underexplored. This research will address this gap by examining how actors influence a user-driven platform, offering insights into digital consumer behavior and the entertainment industry. 

Researching the question “Does an actor influence IMDb popularity ratings of a movie?” offers valuable insights into both film industry dynamics and consumer behavior. The idea of “star power,” or the ability of well-known actors to drive audience interest and movie success, has long been recognized. By analyzing IMDb ratings, we can empirically measure this impact, providing a data-driven understanding of how actors shape audience perception and engagement.

IMDb, with its vast global user base, serves as a critical platform for gauging movie popularity. Understanding whether an actor’s presence correlates with higher ratings can provide important insights for studios and filmmakers when making casting decisions. If actors significantly influence ratings, their value in marketing and production becomes more measurable and strategic.

This research is also important from a consumer behavior perspective. IMDb ratings often guide viewers’ choices, and well-known actors may function as a heuristic that leads audiences to rate movies higher, reflecting how people rely on easily accessible cues to make decisions.

This research will bridge the gaps in understanding how casting choices influence both the commercial and popular success of films.
main

## Methods and Results
#### Methods
To investigate whether an actor influences the IMDb popularity ratings of a movie, we have decided to run a multiple linear regression. We chose this regression because the dependent variable, the movie’s *IMDb averageRating*, is continuous. The goal is to assess how much an actor’s presence influences a movie’s IMDb score while controlling for other variables like the movie's number of votes (numVotes) and other potential confounders. This model can quantify the extent to which actors impact the IMDb ratings, adjusting for other movie-specific factors. 

Model Structure:
In this model, the actor's influence will be captured using the nconst variable, which uniquely identifies each actor in the dataset. Actor-related characteristics like their *primaryName* (name by which they are most often credited), *primaryProfession*, and the movies they are known for (knownForTitles) will be linked to the IMDb *tconst* (unique title identifier) for the movies they participated in. The movie's averageRating will serve as the dependent variable.
To measure an actor’s influence on a movie’s IMDb score, we can use their *nconst* to link actors to specific movies via *knownForTitles*. Actors with higher recognition or fame, as reflected by the number of films they are associated with or their prominence in the *primaryProfession* (e.g., lead actor, director), may influence the IMDb ratings of the movies they are in.
The number of movies an actor is known for (knownForTitles), can be used to assess how an actor’s filmography affects a movie's popularity. An actor with a rich filmography might bring more visibility or audience interest, potentially resulting in a higher *averageRating*.

Control Variables:
NumVotes (Popularity Measure): The number of votes a movie receives (numVotes) can be an indicator of its visibility and popularity. Since more popular movies often have higher ratings, controlling for numVotes ensures that the analysis focuses on the actor's influence on the averageRating rather than how well-known the movie is.

#### Results

## Repository Overview

## Dependencies

Please follow the installation guides on http://tilburgsciencehub.com/.

- R. [Installation guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/).
- Make. [Installation guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/).
- Pandoc. [Installation guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/pandoc/)

- For R, make sure you have installed the following packages:
```
install.packages("data.table")
install.packages("broom")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("fixest")
install.packages("tidyverse")
install.packages("stargazer")
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
Team 5:
- Sophie van Hest, e-mail: s.f.a.vanhest@tilburguniversity.edu
- 
