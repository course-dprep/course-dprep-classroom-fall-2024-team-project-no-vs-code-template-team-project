# Is an individual’s fame related to his/her birth year?
## Introduction
Is there a significant difference in the IMDb popularity scores among different movie genres? A film producer should perhaps consider producing an action genre movie rather than a thriller genre movie, despite that producer's preference for thriller. What other mediators could affect this effect? Some things that will be further explored and analyzed in this research. 

## Research Motivation
Researching the question “Does an actor influence IMDb popularity ratings of a movie?” offers valuable insights into both film industry dynamics and consumer behavior. The idea of “star power,” or the ability of well-known actors to drive audience interest and movie success, has long been recognized. By analyzing IMDb ratings, we can empirically measure this impact, providing a data-driven understanding of how actors shape audience perception and engagement.

IMDb, with its vast global user base, serves as a critical platform for gauging movie popularity. Understanding whether an actor’s presence correlates with higher ratings can provide important insights for studios and filmmakers when making casting decisions. If actors significantly influence ratings, their value in marketing and production becomes more measurable and strategic.

This research is also important from a consumer behavior perspective. IMDb ratings often guide viewers’ choices, and well-known actors may function as a heuristic that leads audiences to rate movies higher, reflecting how people rely on easily accessible cues to make decisions.

This research will bridge the gaps in understanding how casting choices influence both the commercial and popular success of films.

## Methods and Results
#### Methods
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
