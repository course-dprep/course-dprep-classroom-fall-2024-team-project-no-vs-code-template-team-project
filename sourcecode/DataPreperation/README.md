# Data Preperation

## 1. Loading libraries

To start preparing the data, make sure all of the following libraries are loaded:

```
library(googledrive)
library(tidyverse)
library(dplyr)
library(data.table)
library(jsonlite)
library(stringr)
```

## 2. Downloading the data

The data is publicly accessible via a Google Drive folder. This data is automatically retrieved by r using the following code:

```
drive_auth()
folder_id <- "1ioJVCsr5pJ5tAa2dPJ9yxIvL6rYmDSl1"
csv_file <- files_in_folder[files_in_folder$name == "yelp_academic_dataset_business.csv", ]
if (nrow(csv_file) > 0) {
  drive_download(as_id(csv_file$id), path = file.path(getwd(), "yelp_academic_dataset_business.csv"), overwrite = TRUE)
  cat("File downloaded successfully.")
} else {
  cat("The file 'yelp_academic_dataset_business.csv' was not found in the folder.")
}
business <- read_csv("yelp_academic_dataset_business.csv")
```
When running the first line of code (```drive_auth()```), R will ask you to authenticate yourself via Google in order to get access to the folder. In your R console, type ```1``` and press enter to grand R permission to authorize you. You will be send to a browser to log in with you Google account. Please do so in order to download the data.

## 3. Cleaning of the Data

The data cleaning process selects the variables that are relevant to the project,and rearranges the remaining variables in a logical order:

```
business <- business %>% select(-latitude, -longitude, -hours)
business <- business %>% select(business_id, name, is_open ,address, postal_code, city, state, categories, review_count, stars, attributes)
```

After, the variable ```is_open``` is transformed into a dummy variable to find which business are open for business and which are permanently closed. The business that are permanently closed are removed from the data:

```
business$dummy_open <- business$is_open == 1
business <- business %>% filter(business$dummy_open == TRUE)
business$dummy_open <- NULL
```

In order to conduct a proper analysis, only business are selected with at least 50 consumer reviews: 

```
business <- business %>% filter(review_count >= 50)
```

After checking for missing values, some variables are found to have missing values. These missing values mostly do not form a problem, but to perform a proper analysis the missing values of the variables ```address```, ```postal_code``` and ```attributes``` are deleted:

```
business <- business %>%
   filter(!is.na(address) & !is.na(postal_code) & !is.na(categories) & !is.na(attributes))
```

# 4. Operationalization of the Variables

Since the original attribute variable is a list of dictionaries including different variables and their value, it is necessary to recede this attribute variable into separate variables. For each attribute a new column is created displaying the value per business. This is done using the following function:

```
parse_attributes <- function(attr_string) {
  # Clean the string to make it valid JSON syntax
  cleaned_string <- gsub("u'", "'", attr_string) 
  cleaned_string <- gsub("'", "\"", cleaned_string) 
  cleaned_string <- gsub("\\\\\"", "\"", cleaned_string)  
  cleaned_string <- gsub('"(True|False)"', '\\L\\1', cleaned_string, perl = TRUE)  
  cleaned_string <- gsub(": None", ": null", cleaned_string)  # Replace None with null
  cleaned_string <- gsub('(?<=:)\\s*""(.*?)""', '"\\1"', cleaned_string, perl = TRUE)
  cleaned_string <- paste0("{", str_remove_all(cleaned_string, "^\\{|\\}$"), "}")
  parsed_list <- tryCatch(fromJSON(cleaned_string), error = function(e) NULL)
  return(parsed_list)
}

parsed_attributes <- business %>%
  mutate(attributes_list = lapply(attributes, parse_attributes)) %>%
  unnest_wider(attributes_list)
```

Lastly, these newly created attribute variables are recoded into dummy variables where 1 implies that a business does possess this attribute, and 0 if the business does not:

```
parsed_attributes <- parsed_attributes %>% mutate(across(12:42, as.character))
business_prep <- parsed_attributes %>% mutate(across(12:42, 
                ~ recode(., 'NULL' = '0', 'FALSE' = '0', 'None' = '0', 'none' = '0', 'TRUE' = '1',                     'free' = '1', 'beer_and_wine' = '1', 'full_bar' = '1', 'casual' = '1')))

names(business_prep)[names(business_prep) == 'WiFi'] <- 'FreeWiFi'
names(business_prep)[names(business_prep) == 'RestaurantAttire'] <- 'RestaurantCasualAttire'
business_prep[is.na(business_prep)] <- '0'
```