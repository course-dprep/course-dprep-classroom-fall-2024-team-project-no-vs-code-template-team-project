# Load package
library(tidyverse)

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

# Transform the 'data1' and 'data2' and 'data3' dataframe into a CSV file and save it in the specified directory
write_csv(data1, "../../data/data1.csv")
write_csv(data2, "../../data/data2.csv")
write_csv(data3, "../../data/data3.csv")

# Load package
library(tidyverse)

# Read datasets from specific paths

data1 <- read_csv("../../data/data1.csv")
data2 <- read_csv("../../data/data2.csv")
data3 <- read_csv("../../data/data3.csv")


#Data cleaning

# Load package
library(tidyverse)

data1 <- na.omit(data1)
data2 <- na.omit(data2)
data3 <- na.omit(data3)

# This code filters data1 to include only the rows where the primaryProfession column contains the words "actor" or "actress".
data1 <-  data1[grepl("actor|actress", data1$primaryProfession), ]
data3 <- data3[grepl("movie", data3$titleType), ]


# removal of unnecessary columns
library(dplyr)
cdata1 <- data1 %>% select(primaryName, primaryProfession, knownForTitles)
cdata2 <- data2
cdata3 <- data3 %>% select(tconst, primaryTitle, startYear, genres)

# Transform the 'cdata1' and 'cdata2' and 'cdata3' dataframe into a CSV file and save it in the specified directory
write_csv(cdata1, "../../data/cdata1.csv")
write_csv(cdata2, "../../data/cdata2.csv")
write_csv(cdata3, "../../data/cdata3.csv")



