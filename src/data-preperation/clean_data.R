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

