# Load package
library(tidyverse)

# Read datasets from specific paths

cdata1 <- read_csv("../../data/cdata1.csv")
cdata2 <- read_csv("../../data/cdata2.csv")
cdata3 <- read_csv("../../data/cdata3.csv")

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

# Remove rows with NA in 'tconst' in data4
data4 <- data4 %>%
  filter(!is.na(tconst))

data5 <- left_join(data4, cdata1, by = c("tconst"), relationship = "many-to-many")


# delete NA's
data <- na.omit(data5)

# Transform all datasets into a CSV file and save it in the specified directory
write_csv(data, "../../data/data.csv")