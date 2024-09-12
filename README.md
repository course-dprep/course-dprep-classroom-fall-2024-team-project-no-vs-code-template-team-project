# Is an individual’s fame related to his/her birth year?
## Introduction
Is there a significant difference in the IMDb popularity scores among different movie genres? A film producer should perhaps consider producing an action genre movie rather than a thriller genre movie, despite that producer's preference for thriller. What other mediators could affect this effect? Some things that will be further explored and analyzed in this research. 

## Research Motivation
By examining movie ratings and number of votes as a proxy for fame, this study seeks to explore whether people born in certain time periods are more likely to achieve fame in the film industry.

## Methods and Results
#### Methods (This is too long, will make it shorter)
To investigate whether an actor influences the IMDb popularity ratings of a movie, we have decided to run a multiple linear regression. We chose this regression because the dependent variable, the movie’s *IMDb averageRating*, is continuous. The goal is to assess how much an actor’s presence influences a movie’s IMDb score while controlling for other variables like the movie's number of votes (numVotes) and other potential confounders. This model can quantify the extent to which actors impact the IMDb ratings, adjusting for other movie-specific factors. 

Model Structure:
In this model, the actor's influence will be captured using the *nconst* variable, which uniquely identifies each actor in the dataset. Actor-related characteristics like their *primaryName* (name by which they are most often credited), *primaryProfession*, and the movies they are known for (knownForTitles) will be linked to the IMDb *tconst* (unique title identifier) for the movies they participated in. The movie's averageRating will serve as the dependent variable.
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
