# Metadata analysis

## The Datasets
Our research question is asks whether the number of episodes signifcanlty influence the ratings of TV shows?
To answer this question we are going to use the following datasets: 'https://datasets.imdbws.com/title.episode.tsv.gz', 'https://datasets.imdbws.com/title.ratings.tsv.gz','https://datasets.imdbws.com/title.basics.tsv.gz'. 

These datasets were acquired through IMDb's non-commerical datasets page developer.imdb.com. These datasets are subsets of IMDb data available for personal and non-commerical use.

## Dataset raw data
1. [Title episodes]('https://datasets.imdbws.com/title.episode.tsv.gz') has a total of 8502080 rows and 4 columns. The columns contain information about the episode identifier, parent title identifier, season number a episode belongs to and the episode number of the TV show
2. [Title ratings]('https://datasets.imdbws.com/title.ratings.tsv.gz') has a total of 1477077 rows and 3 columns. The columns contain information about the title identifier, weighted average of all individual user ratings and number of votes the title has received 
3. [Titles basics]('https://datasets.imdbws.com/title.basics.tsv.gz')** has a total of 11084904 rows and 9 columns. The columns contain information about the title identifier, type/format of the title, primary title used by filmmakers on promotional material at point of release, original title in original language, boolean whether it is a adult title, release year, end year, runtime and three genres associated with the title. 

## Time period
There is no specific time period covered by the datasets. It seems that the whole IMDb catalogue is included in the dataset due to the large amount of entrees (rows). The data was collected on March 18th, 2024.

## Transformations
Some transformations that would have to be done to make sure the dataset aligns with what we want to research. One of these transformations is making sure that we handle the missing data in each of the datasets.This is already done by na = '\\N' when downloading the data to RStudio. This would convert any missing value to the value 'NA'. This allows us to more easily filter out missing values when conducting our analysis on the dataset. Another transformation would be summarizing certain data and assigning variables to this data. For example, grouping all titles that fall under the TV show category so that we don't include movies, short films, videos etc. in our analysis since these genres don't have episodes.

## Analysis
Finally, we will be using a multiple regression analysis to analyze the significance of the number of episodes on the ratings of TV shows. The multiple regression analysis shows how several independent variables influence the dependent variable. Additionally the multiple regression is convenient to interpret. With this type of analysis it can be determined how much each independent variable influences the dependent variable ratings and which independent variable influences the ratings most significantly.

