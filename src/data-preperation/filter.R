This research specifically investigates the impact of actors in films on IMDb ratings. Consequently, the dataset will focus exclusively on information pertinent to actors, rendering data related to producers, writers, or directors as extraneous. Therefore, we will filter data1 to include only the relevant information for actors and actresses.
Additionally, this research is exclusively concerned with movies. As such, we will remove all entries in data3 that are not related to this category.

```{r}
# This code filters data1 to include only the rows where the primaryProfession column contains the words "actor" or "actress".
data1 <-  data1[grepl("actor|actress", data1$primaryProfession), ]
data3 <- data3[grepl("movie", data3$titleType), ]