# Is an individual’s fame related to his/her birth year?
## Introduction
Is there a significant difference in the IMDb popularity scores among different movie genres? A film producer should perhaps consider producing an action genre movie rather than a thriller genre movie, despite that producer's preference for thriller. What other mediators could affect this effect? Some things that will be further explored and analyzed in this research. 

## Research Motivation
By examining movie ratings and number of votes as a proxy for fame, this study seeks to explore whether people born in certain time periods are more likely to achieve fame in the film industry.

## Methods and Results
#### Methods
To investigate whether an actor influences the IMDb popularity ratings of a movie, we have decided to run a multiple linear regression. We chose this regression because the dependent variable, the movie’s *IMDb averageRating*, is continuous. The goal is to assess how much an actor’s presence influences a movie’s IMDb score while controlling for other variables like the movie's number of votes (numVotes) and other potential confounders. This model can quantify the extent to which actors impact the IMDb ratings, adjusting for other movie-specific factors.
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
