# Read datasets from specific paths

data1 <- read_csv("../../data/data1.csv")
data2 <- read_csv("../../data/data2.csv")
data3 <- read_csv("../../data/data3.csv")


# This code filters data1 to include only the rows where the primaryProfession column contains the words "actor" or "actress".
data1 <-  data1[grepl("actor|actress", data1$primaryProfession), ]
data3 <- data3[grepl("movie", data3$titleType), ]


# removal of unnecessary columns
library(dplyr)
cdata1 <- data1 %>% select(primaryName, primaryProfession, knownForTitles)
cdata2 <- data2
cdata3 <- data3 %>% select(tconst, primaryTitle, startYear, genres)

library(data.table)

# Convert to data.table
setDT(cdata1)
setDT(cdata3)

# Split 'knownForTitles' into separate rows
cdata1 <- cdata1[, .(primaryName, primaryProfession, tconst = unlist(strsplit(knownForTitles, ","))), by = .I]

# Split 'genres' into separate rows
cdata3 <- cdata3[, .(tconst, primaryTitle, startYear, genre = unlist(strsplit(genres, ","))), by = .I]

# creating 1 dataset
data4 <- left_join(cdata2, cdata3, by = "tconst") 
data5 <- left_join(data4, cdata1, by = c("tconst"))
```

# delete NA's
data <- na.omit(data5)

# Transform all datasets into a CSV file and save it in the specified directory
write_csv(data, "../../gen/data-preparation/temp/data.csv")