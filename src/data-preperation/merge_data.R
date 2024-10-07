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