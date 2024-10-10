Following these adjustments to the datasets, we also removed unnecessary columns that contained information deemed irrelevant to the scope of this research.

```{r}
# removal of unnecessary columns
library(dplyr)
cdata1 <- data1 %>% select(primaryName, primaryProfession, knownForTitles)
cdata2 <- data2
cdata3 <- data3 %>% select(tconst, primaryTitle, startYear, genres)
```
