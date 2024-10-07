```{r echo=FALSE, warning=FALSE}
url1 <- "https://datasets.imdbws.com/name.basics.tsv.gz"
url2 <- "https://datasets.imdbws.com/title.ratings.tsv.gz"
url3 <- "https://datasets.imdbws.com/title.basics.tsv.gz"

file1 <- "name.basics.tsv.gz"
file2 <- "title.ratings.tsv.gz"
file3 <- "title.basics.tsv.gz"

if (!file.exists(file1)) {
  download.file(url1, file1)
}
if (!file.exists(file2)) {
  download.file(url2, file2)
}
if (!file.exists(file3)) {
  download.file(url3, file3)
}

data1 <- read.csv(gzfile(file1), sep = "\t")
data2 <- read.csv(gzfile(file2), sep = "\t")
data3 <- read.csv(gzfile(file3), sep = "\t")

```

#Data cleaning
To ensure the integrity and usability of our datasets, we will undertake a systematic cleaning process. This involves addressing missing values and evaluating which variables may be extraneous to our analytical objectives.
In the examination of datasets data1 and data3, we identified one row in each dataset containing missing values. In data1, we encountered an entry for an actor that lacked both a name and birth information. This row was subsequently removed, as the absence of a name impedes our ability to accurately identify the actor.
In data3, we identified a row that contained no substantive values other than the classification as a TV episode. This entry is not suitable for our analysis, as it lacks a name necessary for establishing any meaningful connections.

```{r}
data1 <- na.omit(data1)
data2 <- na.omit(data2)
data3 <- na.omit(data3)
```

This research specifically investigates the impact of actors in films on IMDb ratings. Consequently, the dataset will focus exclusively on information pertinent to actors, rendering data related to producers, writers, or directors as extraneous. Therefore, we will filter data1 to include only the relevant information for actors and actresses.
Additionally, this research is exclusively concerned with movies. As such, we will remove all entries in data3 that are not related to this category.

```{r}
# This code filters data1 to include only the rows where the primaryProfession column contains the words "actor" or "actress".
data1 <-  data1[grepl("actor|actress", data1$primaryProfession), ]
data3 <- data3[grepl("movie", data3$titleType), ]
```
Following these adjustments to the datasets, we also removed unnecessary columns that contained information deemed irrelevant to the scope of this research.

```{r}
# removal of unnecessary columns
library(dplyr)
cdata1 <- data1 %>% select(primaryName, primaryProfession, knownForTitles)
cdata2 <- data2
cdata3 <- data3 %>% select(tconst, primaryTitle, startYear, genres)
```

```{r}
library(data.table)

# Convert to data.table
setDT(cdata1)
setDT(cdata3)

# Split 'knownForTitles' into separate rows
cdata1 <- cdata1[, .(primaryName, primaryProfession, tconst = unlist(strsplit(knownForTitles, ","))), by = .I]

# Split 'genres' into separate rows
cdata3 <- cdata3[, .(tconst, primaryTitle, startYear, genre = unlist(strsplit(genres, ","))), by = .I]
```


```{r}
# creating 1 dataset
data4 <- left_join(cdata2, cdata3, by = "tconst") 
data5 <- left_join(data4, cdata1, by = c("tconst"))
```

```{r}
# delete NA's
data <- na.omit(data5)
```

# Write new file with final output data
write_csv(data,file = "../../gen/output/data.csv")