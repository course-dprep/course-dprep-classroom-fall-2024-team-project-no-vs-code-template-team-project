# Data Preperation

When running the make file within the DataPreparation folder, the data preperation will automatically run. The makefile follows the following steps for the data preparation of the Yelp dataset:

## 0. Installing Pacakges
A few R packages are necessary in order to run the data preperation. These packages are:
```
googledrive
readr
data.table
dplyr
tidyr
gridExtra
```
When they makefile is run, it will automatically download these packages. There is no need to do it manually.

## 1. Importing Data
The data is stored in a public Google Drive folder. The following function will open this Google Drive folder and download the data:
```
import_data <- function() {
  drive_deauth()  
  folder_id <- "1ioJVCsr5pJ5tAa2dPJ9yxIvL6rYmDSl1"
  files_in_folder <- drive_ls(as_id(folder_id))
  csv_file <- files_in_folder[files_in_folder$name ==     "yelp_academic_dataset_business.csv", ]
  if (nrow(csv_file) > 0) {
    temp_file <- tempfile(fileext = ".csv")
    drive_download(as_id(csv_file$id), path = temp_file, overwrite = TRUE)
    data_business <- read_csv(temp_file)
    return(data_business)
  } else {
    stop("The file 'yelp_academic_dataset_business.csv' was not found in the folder.")
  }
}

business_data <- import_data()
```
After the code has run, the dataset is stored (in csv format) in a by the makefile newly created 'data' folder in the main directory of the project. The stored csv file is called 'business_data'.

## 2. Cleaning Data
The data cleaning process is done using a function. The function looks as follows:
```
clean_data <- function(data) {
  
  # 2.1
  cleaned_data <- business_data %>%
    select(-latitude, -longitude, -hours) %>%
    select(business_id, name, is_open, address, postal_code, city, state, categories, review_count, stars, attributes)
  
  # 2.2
  cleaned_data <- cleaned_data %>%
    filter(is_open == 1)
  
  # 2.3
  cleaned_data <- cleaned_data %>%
    filter(!is.na(address) & !is.na(postal_code) & !is.na(attributes))
  
  # 2.4
  cleaned_data <- cleaned_data %>%
    filter(review_count >= 50)
  
  return(cleaned_data)  # Return the cleaned data
}

cleaned_data <- clean_data(business_data)
```
This cleaning function consists of four elements:

### 2.1
In this section the unrelevant variables are removed from the date so the remaining dataset is clear and contains solely relevant information. The deleted variables are:
- latitude (geographical latitude of the business)
  - Other, more informational, variables are present that also refer to location,        such as address, postal code, city and state
- longtitude (geographical longtitude of the business)
  - Other, more informational, variables are present that also refer to location,        such as address, postal code, city and state
- hours (opening hours of the business)
  - Complicated structured variable that is difficult to work with and that does not     add meaningful information with regards to the analysis

### 2.2
The dataset contains a variable called ```is.open```, which indicated whether the specific business is open for business or temporarily closed. In other to base the analysis on present-day businesses, the temporarily closed business are removed from the data.

### 2.3
The variables ```address``` and ```postal_code``` have a small amount of NAs. In order to keep the analysis valid and only include business that have an address and are actually in business, these NA observations are deleted.

### 2.4
The ```stars``` variable, the dependent variable of the analysis, is the average star rating of all reviews for a business. The number of reviews per business, what the star ratings is based on, is also captured in a variable called ```review_count```. To keep the analysis reliable and to decrease errors, only businesses that have 50 or more reviews are retained. Business with under 50 reviews are removed from the dataset.

### Remaining Dataset
The remaining dataset contains observations of 23,191 business for the following 11 variables:
- business_id
- name
- is_open
- postal_code
- city
- state
- categories
- review_count
- attributes
The cleaned dataset is stored in a csv called 'data_cleaned_for_preperation' within the 'data' folder in the main directory.

## 3. Perparing Data
The preperation of the data consists of two functions:

### 3.1 Creating New Dummy Variables Per Category
This project analyses if specific business categories naturally have higher consumer ratings. Therefor it is necessary to have separate categories. The data contains the variable ```categories``` which is a list of multiple category the business is classified in. In order to conduct the analysis, it is required to separate these categories into new dummy variables, indicating with 1 if the business is classified in that category and 0 otherwise. To do this, the following function is used:
```r
seperate_categories <- function(data, category) {
  data <- data %>%
    mutate(dummy_variable = ifelse(grepl(category, data$categories, ignore.case = TRUE), 1, 0)) %>%
    rename(!!paste0("dummy_", category) := dummy_variable) 
  
  return(data)
}
```
Since separating and analyzing all categories is nearly impossible, the main categories should be determined and separated. After the data exploration and profound analysis of the category variable, the following ten main categories where identified:
- Restaurants
- Shopping
- Home Service
- Beauty & Spas
- Health & Medical
- Local Service
- Automotive
- Active Life
- Hotels & Travel
- Arts & Entertainment
The dummy variables of these categories are created by looping a list of the categories through the separating function:
```
categories <- c("Restaurants", "Shopping", "Home Service", "Beauty & Spas", 
                "Health & Medical", "Local Service", "Automotive", 
                "Active Life", "Hotels & Travel")

for (category in categories) {
  cleaned_data <- seperate_categories(cleaned_data, category)

prepared_data <- cleaned_data
```
Now, ten new variables are created, one per category, containing solely 0s and 1s indicating whether a specific business falls in that category or not.

### 4.3 Creating Frequency Table Function
In order to determine the validity of the sample it is important to analyze the occurrence 1s for each category. If the occurrence of 1s is too low for a category, the sample is insufficient and this category is not valid to be analyzed. To create a frequency table to analyze the sample the following function is used:
```
create_frequency_table <- function(data) {
  # Initialize an empty data frame to store the results
  frequency_table <- data.frame(Variable = character(), Count_0 = integer(), 
  Count_1 = integer(), stringsAsFactors = FALSE)
  
  # Loop through variables 12 to 20
  for (i in 12:20) {
    # Get the counts of 0s and 1s
    count_0 <- sum(data[[i]] == 0, na.rm = TRUE)
    count_1 <- sum(data[[i]] == 1, na.rm = TRUE)
    
    # Append the results to the frequency table
    frequency_table <- rbind(frequency_table, data.frame(Variable = names(data)[i], Count_0 = count_0, Count_1 = count_1))
  }


  return(frequency_table)
}

frequency_table_categories = create_frequency_table(prepared_data)
```
The function creates a frequency table showing the number of 0s and 1s for each of the ten predetermined categories of which dummy variables where formed. This table is stored in pdf format in the 'temp' folder within the 'gen' folder in the main directory. The table looks as follow:
| Variable | Count_0 | Count_1 | 
|-------:|:------:|:-----------:|
| Restaurants | 7726 | 15466 | 
| Shopping | 21623 | 1568 |
| Home Service | 22668 | 523 |
| Beauty & Spas | 21743 | 1448 |
| Health & Medical | 22706 | 485 |
| Local Service | 22638 | 553 |
| Automotive | 22282 | 909 |
| Active Life | 22488 | 703 |
| Hotels & Travels | 21897 | 1294 |
| Arts & Entertainment | 22050 | 1141 |

Based on this table, the sample seems sufficient. Each category has at least 485 businesses classified in that category. This means that an analysis based on this sample will be valid.

### Prepared Dataset
The prepared dataset contains 21 variables, of which the 11 previously stated variables and 10 dummy variables for each of the ten categories that will be analysed. The prepared dataset is stored in a csv file within the 'data' folder in the main directory named 'prepared_data'.