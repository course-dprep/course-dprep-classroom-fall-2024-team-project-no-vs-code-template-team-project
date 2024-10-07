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