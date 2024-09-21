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
<tr>
<th style="text-align: left;">Variable</th>
<th style="text-align: left;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">tconst</td>
<td style="text-align: left;">Alphanumeric unique identifier of the
title.</td>
</tr>
<tr>
<td style="text-align: left;">titleType</td>
<td style="text-align: left;">Type of title (e.g., movie, short,
tvseries, tvepisode).</td>
</tr>
<tr>
<td style="text-align: left;">primaryTitle</td>
<td style="text-align: left;">The most popular title at the time of
release.</td>
</tr>
<tr>
<td style="text-align: left;">originalTitle</td>
<td style="text-align: left;">Title in the original language.</td>
</tr>
<tr>
<td style="text-align: left;">isAdult</td>
<td style="text-align: left;">Indicates whether the title is adult
content (0: No, 1: Yes).</td>
</tr>
<tr>
<td style="text-align: left;">startYear</td>
<td style="text-align: left;">The year the title was first
released.</td>
</tr>
<tr>
<td style="text-align: left;">endYear</td>
<td style="text-align: left;">The year the title ended (NA for
non-series).</td>
</tr>
<tr>
<td style="text-align: left;">runtimeMinutes</td>
<td style="text-align: left;">Runtime of the title in minutes.</td>
</tr>
<tr>
<td style="text-align: left;">genres</td>
<td style="text-align: left;">Includes up to three genres associated
with the title.</td>
</tr>
</tbody>
</table>

View the first rows of the data.

    ## # A tibble: 6 × 9
    ##   tconst    titleType primaryTitle           originalTitle          isAdult startYear endYear runtimeMinutes genres     
    ##   <chr>     <chr>     <chr>                  <chr>                    <dbl>     <dbl>   <dbl>          <dbl> <chr>      
    ## 1 tt0000001 short     Carmencita             Carmencita                   0      1894      NA              1 Documentar…
    ## 2 tt0000002 short     Le clown et ses chiens Le clown et ses chiens       0      1892      NA              5 Animation,…
    ## 3 tt0000003 short     Pauvre Pierrot         Pauvre Pierrot               0      1892      NA              5 Animation,…
    ## 4 tt0000004 short     Un bon bock            Un bon bock                  0      1892      NA             12 Animation,…
    ## 5 tt0000005 short     Blacksmith Scene       Blacksmith Scene             0      1893      NA              1 Comedy,Sho…
    ## 6 tt0000006 short     Chinese Opium Den      Chinese Opium Den            0      1894      NA              1 Short

<figure>
<img
src="AssignmentDprep_files/figure-markdown_strict/unnamed-chunk-5-1.png"
alt="Figure 1: Number of Titles by Adult Content Classification" />
<figcaption aria-hidden="true">Figure 1: Number of Titles by Adult
Content Classification</figcaption>
</figure>

Figure 1 shows us a difference between does contain “is adult” and does
not contain “is adult” titles. The vast majority of titles are not only
for adults. More than 10 million titles dont have the ‘is adult’ stamp,
on the other hand there are around 350,000 titles that do contain the
‘is adult’ stamp.

#### title.ratings.tsv.gz

This file contains user ratings and the number of votes for each title.

<table>
<caption>Variables in title.ratings</caption>
<thead>
<tr>
<th style="text-align: left;">Variable</th>
<th style="text-align: left;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">tconst</td>
<td style="text-align: left;">Alphanumeric unique identifier of the
title.</td>
</tr>
<tr>
<td style="text-align: left;">averageRating</td>
<td style="text-align: left;">Weighted average of all user ratings.</td>
</tr>
<tr>
<td style="text-align: left;">numVotes</td>
<td style="text-align: left;">Number of votes the title has
received.</td>
</tr>
</tbody>
</table>

View the first rows of the data

    ## # A tibble: 6 × 3
    ##   tconst    averageRating numVotes
    ##   <chr>             <dbl>    <dbl>
    ## 1 tt0000001           5.7     2088
    ## 2 tt0000002           5.6      283
    ## 3 tt0000003           6.5     2092
    ## 4 tt0000004           5.4      184
    ## 5 tt0000005           6.2     2825
    ## 6 tt0000006           5        196

Analyse the data

![Figure 2: Distribution of Average
Ratings](AssignmentDprep_files/figure-markdown_strict/unnamed-chunk-8-1.png)
Figure 2 shows the distribution of ratings for the te titels, the
highest frequency takes place between grades 6.0 and 8.0 with a peak
around 7.5. Furthermore, there are fewer lower ratings for the titels.

<table>
<caption>Number of Titles per Voting Category</caption>
<thead>
<tr>
<th style="text-align: left;">vote_category</th>
<th style="text-align: right;">count</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">0-100</td>
<td style="text-align: right;">1107998</td>
</tr>
<tr>
<td style="text-align: left;">101-1,000</td>
<td style="text-align: right;">278778</td>
</tr>
<tr>
<td style="text-align: left;">1,001-10,000</td>
<td style="text-align: right;">75587</td>
</tr>
<tr>
<td style="text-align: left;">10,001-50,000</td>
<td style="text-align: right;">10496</td>
</tr>
<tr>
<td style="text-align: left;">50,001-100,000</td>
<td style="text-align: right;">2149</td>
</tr>
<tr>
<td style="text-align: left;">100,001+</td>
<td style="text-align: right;">2796</td>
</tr>
</tbody>
</table>

Table 4 shows how many votes the titles received. The majority has less
then 100 votes, there are about 5000 titels with more then 50.000 votes.

#### title.episode.tsv.gz

This file contains information about TV show episodes.

<table>
<caption>Variables in title.episode</caption>
<thead>
<tr>
<th style="text-align: left;">Variable</th>
<th style="text-align: left;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">tconst</td>
<td style="text-align: left;">Alphanumeric identifier of the
episode.</td>
</tr>
<tr>
<td style="text-align: left;">parentTconst</td>
<td style="text-align: left;">Identifier of the parent TV series.</td>
</tr>
<tr>
<td style="text-align: left;">seasonNumber</td>
<td style="text-align: left;">The season number the episode belongs
to.</td>
</tr>
<tr>
<td style="text-align: left;">episodeNumber</td>
<td style="text-align: left;">The episode number within the season.</td>
</tr>
</tbody>
</table>

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
<caption>Number of TV Series per Episode Category</caption>
<thead>
<tr>
<th style="text-align: left;">episode_category</th>
<th style="text-align: right;">count</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">1-5</td>
<td style="text-align: right;">71583</td>
</tr>
<tr>
<td style="text-align: left;">6-10</td>
<td style="text-align: right;">48359</td>
</tr>
<tr>
<td style="text-align: left;">11-20</td>
<td style="text-align: right;">35832</td>
</tr>
<tr>
<td style="text-align: left;">21-50</td>
<td style="text-align: right;">27500</td>
</tr>
<tr>
<td style="text-align: left;">51-100</td>
<td style="text-align: right;">12024</td>
</tr>
<tr>
<td style="text-align: left;">100+</td>
<td style="text-align: right;">14438</td>
</tr>
</tbody>
</table>

<table>
<caption>Summary Statistics for Number of Episodes per TV
Series</caption>
<thead>
<tr>
<th style="text-align: right;">Minimum</th>
<th style="text-align: right;">Maximum</th>
<th style="text-align: right;">Mean</th>
<th style="text-align: right;">Median</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: right;">1</td>
<td style="text-align: right;">18593</td>
<td style="text-align: right;">40.56</td>
<td style="text-align: right;">8</td>
</tr>
</tbody>
</table>

Tables 5 and 6 give us clarity on how many episodes the TV series have.
The dataset contains a maximum number of episodes of 18593 and the
average number of episodes per TV series is 8.

### Merging the data

View first rows of the merged data set

    ## # A tibble: 6 × 13
    ##   tconst    titleType primaryTitle           originalTitle isAdult startYear endYear runtimeMinutes genres episode_count
    ##   <chr>     <chr>     <chr>                  <chr>           <dbl>     <dbl>   <dbl>          <dbl> <chr>          <int>
    ## 1 tt0035599 tvSeries  Voice of Firestone Te… Voice of Fir…       0      1943    1947             15 <NA>               1
    ## 2 tt0035803 tvSeries  The German Weekly Rev… Die Deutsche…       0      1940    1945             NA Docum…             8
    ## 3 tt0038276 tvSeries  You Are an Artist      You Are an A…       0      1946    1955             15 Talk-…             7
    ## 4 tt0039120 tvSeries  Americana              Americana           0      1947    1949             30 Famil…             4
    ## 5 tt0039121 tvSeries  Birthday Party         Birthday Par…       0      1947    1949             30 Family            NA
    ## 6 tt0039122 tvSeries  The Borden Show        The Borden S…       0      1947      NA             30 Comed…             6
    ## # ℹ 3 more variables: averageRating <dbl>, numVotes <dbl>, vote_category <fct>

### Cleaning the data

View first rows of the cleaned data set

    ## # A tibble: 6 × 9
    ##   tconst    titleType primaryTitle             originalTitle  isAdult episode_count averageRating numVotes vote_category
    ##   <chr>     <chr>     <chr>                    <chr>            <dbl>         <int>         <dbl>    <dbl> <fct>        
    ## 1 tt0035803 tvSeries  The German Weekly Review Die Deutsche …       0             8           8         63 0-100        
    ## 2 tt0039120 tvSeries  Americana                Americana            0             4           2.7       18 0-100        
    ## 3 tt0039123 tvSeries  Kraft Theatre            Kraft Televis…       0           587           8        224 101-1,000    
    ## 4 tt0039125 tvSeries  Public Prosecutor        Public Prosec…       0            18           5.9       35 0-100        
    ## 5 tt0040021 tvSeries  Actor's Studio           Actor's Studio       0            65           6.9       93 0-100        
    ## 6 tt0040028 tvSeries  Talent Scouts            Talent Scouts        0            55           6.1       26 0-100

### Filter TV series with a minimum of 25 votes

View first rows of the Filtered data set

    ## # A tibble: 6 × 9
    ##   tconst    titleType primaryTitle             originalTitle  isAdult episode_count averageRating numVotes vote_category
    ##   <chr>     <chr>     <chr>                    <chr>            <dbl>         <int>         <dbl>    <dbl> <fct>        
    ## 1 tt0035803 tvSeries  The German Weekly Review Die Deutsche …       0             8           8         63 0-100        
    ## 2 tt0039123 tvSeries  Kraft Theatre            Kraft Televis…       0           587           8        224 101-1,000    
    ## 3 tt0039125 tvSeries  Public Prosecutor        Public Prosec…       0            18           5.9       35 0-100        
    ## 4 tt0040021 tvSeries  Actor's Studio           Actor's Studio       0            65           6.9       93 0-100        
    ## 5 tt0040028 tvSeries  Talent Scouts            Talent Scouts        0            55           6.1       26 0-100        
    ## 6 tt0040034 tvSeries  Candid Camera            Candid Camera        0            13           7        157 101-1,000

### References

IMDb Datasets: <https://developer.imdb.com/non-commercial-datasets/>
