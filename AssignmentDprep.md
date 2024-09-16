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
the question: “To what extent does the number of a TV show’s episodes
impact its average rating, and does this differ between adult titles and
non-adult titles?” The insights gained from this research could assist
producers in making more informed decisions with regards to episode
count when creating content.

A multiple linear regression will be the applied research method, with
average show rating as the dependent variable. The independent variables
will consist of the continuous variable “number of episodes”, as well as
the dummy variable “adult title” (with 1 for adult shows, 0 for
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

    library(tidyr)
    library(dplyr)
    library(readr)
    library(knitr)
    library(ggplot2)
    library(kableExtra)

### Load the data files 

Load the ‘title basics’, ‘title ratings’ & ‘title episode’ datasets.

### Explanation of the data files

#### title.basics.tsv.gz

This file contains basic information about the titles from the movies
and TV shows in the IMDb database.

<table>
<caption>Variables in title.basics</caption>
<colgroup>
<col style="width: 19%" />
<col style="width: 80%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">Variable</th>
<th style="text-align: left;">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">tconst</td>
<td style="text-align: left;">Alphanumeric unique identifier of the
title.</td>
</tr>
<tr class="even">
<td style="text-align: left;">titleType</td>
<td style="text-align: left;">Type of title (e.g., movie, short,
tvseries, tvepisode).</td>
</tr>
<tr class="odd">
<td style="text-align: left;">primaryTitle</td>
<td style="text-align: left;">The most popular title at the time of
release.</td>
</tr>
<tr class="even">
<td style="text-align: left;">originalTitle</td>
<td style="text-align: left;">Title in the original language.</td>
</tr>
<tr class="odd">
<td style="text-align: left;">isAdult</td>
<td style="text-align: left;">Indicates whether the title is adult
content (0: No, 1: Yes).</td>
</tr>
<tr class="even">
<td style="text-align: left;">startYear</td>
<td style="text-align: left;">The year the title was first
released.</td>
</tr>
<tr class="odd">
<td style="text-align: left;">endYear</td>
<td style="text-align: left;">The year the title ended (NA for
non-series).</td>
</tr>
<tr class="even">
<td style="text-align: left;">runtimeMinutes</td>
<td style="text-align: left;">Runtime of the title in minutes.</td>
</tr>
<tr class="odd">
<td style="text-align: left;">genres</td>
<td style="text-align: left;">Includes up to three genres associated
with the title.</td>
</tr>
</tbody>
</table>

Variables in title.basics

View the first rows of the data.

    ## # A tibble: 6 × 9
    ##   tconst    titleType primaryTitle           originalTitle          isAdult startYear endYear runtimeMinutes genres                  
    ##   <chr>     <chr>     <chr>                  <chr>                    <dbl>     <dbl>   <dbl>          <dbl> <chr>                   
    ## 1 tt0000001 short     Carmencita             Carmencita                   0      1894      NA              1 Documentary,Short       
    ## 2 tt0000002 short     Le clown et ses chiens Le clown et ses chiens       0      1892      NA              5 Animation,Short         
    ## 3 tt0000003 short     Pauvre Pierrot         Pauvre Pierrot               0      1892      NA              5 Animation,Comedy,Romance
    ## 4 tt0000004 short     Un bon bock            Un bon bock                  0      1892      NA             12 Animation,Short         
    ## 5 tt0000005 short     Blacksmith Scene       Blacksmith Scene             0      1893      NA              1 Comedy,Short            
    ## 6 tt0000006 short     Chinese Opium Den      Chinese Opium Den            0      1894      NA              1 Short

<figure>
<img
src="AssignmentDprep_files/figure-markdown_strict/unnamed-chunk-49-1.png"
alt="Figure 1: Distribution of Genres" />
<figcaption aria-hidden="true">Figure 1: Distribution of
Genres</figcaption>
</figure>

Figure 1 shows in what sizes the titles are distributed among the
different genres, clearly drama and comedy are the most common.

<figure>
<img
src="AssignmentDprep_files/figure-markdown_strict/unnamed-chunk-50-1.png"
alt="Figure 2: Number of Titles by Adult Content Classification" />
<figcaption aria-hidden="true">Figure 2: Number of Titles by Adult
Content Classification</figcaption>
</figure>

Figure 2 shows us a difference between does contain “is adult” and does
not contain “is adult” titles. The vast majority of titles are not only
for adults. More than 10 million titles dont have the ‘is adult’ stamp,
on the other hand there are around 350,000 titles that do contain the
‘is adult’ stamp.

#### title.ratings.tsv.gz

This file contains user ratings and the number of votes for each title.

<table>
<caption>Variables in title.ratings</caption>
<thead>
<tr class="header">
<th style="text-align: left;">Variable</th>
<th style="text-align: left;">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">tconst</td>
<td style="text-align: left;">Alphanumeric unique identifier of the
title.</td>
</tr>
<tr class="even">
<td style="text-align: left;">averageRating</td>
<td style="text-align: left;">Weighted average of all user ratings.</td>
</tr>
<tr class="odd">
<td style="text-align: left;">numVotes</td>
<td style="text-align: left;">Number of votes the title has
received.</td>
</tr>
</tbody>
</table>

Variables in title.ratings

View the first rows of the data

    ## # A tibble: 6 × 3
    ##   tconst    averageRating numVotes
    ##   <chr>             <dbl>    <dbl>
    ## 1 tt0000001           5.7     2086
    ## 2 tt0000002           5.6      283
    ## 3 tt0000003           6.5     2090
    ## 4 tt0000004           5.4      184
    ## 5 tt0000005           6.2     2824
    ## 6 tt0000006           5        195

Analyse the data

![Figure 3: Distribution of Average
Ratings](AssignmentDprep_files/figure-markdown_strict/unnamed-chunk-53-1.png)
Figure 3 shows the distribution of ratings for the te titels, the
highest frequency takes place between grades 6.0 and 8.0 with a peak
around 7.5. Furthermore, there are fewer lower ratings for the titels.

<table>
<caption>Table 1: Number of Titles per Voting Category</caption>
<thead>
<tr class="header">
<th style="text-align: left;">vote_category</th>
<th style="text-align: right;">count</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">0-100</td>
<td style="text-align: right;">1106709</td>
</tr>
<tr class="even">
<td style="text-align: left;">101-1,000</td>
<td style="text-align: right;">278567</td>
</tr>
<tr class="odd">
<td style="text-align: left;">1,001-10,000</td>
<td style="text-align: right;">75518</td>
</tr>
<tr class="even">
<td style="text-align: left;">10,001-50,000</td>
<td style="text-align: right;">10484</td>
</tr>
<tr class="odd">
<td style="text-align: left;">50,001-100,000</td>
<td style="text-align: right;">2149</td>
</tr>
<tr class="even">
<td style="text-align: left;">100,001+</td>
<td style="text-align: right;">2791</td>
</tr>
</tbody>
</table>

Table 1: Number of Titles per Voting Category

Table 1 shows how many votes the titles received. The majority has less
then 100 votes, there are about 5000 titels with more then 50.000 votes.

#### title.episode.tsv.gz

This file contains information about TV show episodes.

<table>
<caption>Variables in title.episode</caption>
<thead>
<tr class="header">
<th style="text-align: left;">Variable</th>
<th style="text-align: left;">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">tconst</td>
<td style="text-align: left;">Alphanumeric identifier of the
episode.</td>
</tr>
<tr class="even">
<td style="text-align: left;">parentTconst</td>
<td style="text-align: left;">Identifier of the parent TV series.</td>
</tr>
<tr class="odd">
<td style="text-align: left;">seasonNumber</td>
<td style="text-align: left;">The season number the episode belongs
to.</td>
</tr>
<tr class="even">
<td style="text-align: left;">episodeNumber</td>
<td style="text-align: left;">The episode number within the season.</td>
</tr>
</tbody>
</table>

Variables in title.episode

View the first rows of the data

    ## # A tibble: 6 × 4
    ##   tconst    parentTconst seasonNumber episodeNumber
    ##   <chr>     <chr>               <dbl>         <dbl>
    ## 1 tt0031458 tt32857063             NA            NA
    ## 2 tt0041951 tt0041038               1             9
    ## 3 tt0042816 tt0989125               1            17
    ## 4 tt0042889 tt0989125              NA            NA
    ## 5 tt0043426 tt0040051               3            42
    ## 6 tt0043631 tt0989125               2            16

<table>
<caption>Table 2: Number of TV Series per Episode Category</caption>
<thead>
<tr class="header">
<th style="text-align: left;">episode_category</th>
<th style="text-align: right;">count</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">1-5</td>
<td style="text-align: right;">71510</td>
</tr>
<tr class="even">
<td style="text-align: left;">6-10</td>
<td style="text-align: right;">48305</td>
</tr>
<tr class="odd">
<td style="text-align: left;">11-20</td>
<td style="text-align: right;">35783</td>
</tr>
<tr class="even">
<td style="text-align: left;">21-50</td>
<td style="text-align: right;">27482</td>
</tr>
<tr class="odd">
<td style="text-align: left;">51-100</td>
<td style="text-align: right;">12009</td>
</tr>
<tr class="even">
<td style="text-align: left;">100+</td>
<td style="text-align: right;">14431</td>
</tr>
</tbody>
</table>

Table 2: Number of TV Series per Episode Category

<table>
<caption>Table 3: Summary Statistics for Number of Episodes per TV
Series</caption>
<thead>
<tr class="header">
<th style="text-align: right;">Minimum</th>
<th style="text-align: right;">Maximum</th>
<th style="text-align: right;">Mean</th>
<th style="text-align: right;">Median</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: right;">1</td>
<td style="text-align: right;">18593</td>
<td style="text-align: right;">40.55</td>
<td style="text-align: right;">8</td>
</tr>
</tbody>
</table>

Table 3: Summary Statistics for Number of Episodes per TV Series

Tables 2 and 3 give us clarity on how many episodes the TV series have.
The dataset contains a maximum number of episodes of 18593 and the
average number of episodes per TV series is 8.

### References

IMDb Datasets: <https://developer.imdb.com/non-commercial-datasets/>
