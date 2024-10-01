## SETUP
library(googledrive)
library(readr)

## INPUT
# Function to import data from Google Drive
import_data <- function() {
  # Authenticate with Google Drive (if not already authenticated)
  drive_deauth()  
  
  # Define the folder ID where the file is located
  folder_id <- "1ioJVCsr5pJ5tAa2dPJ9yxIvL6rYmDSl1"
  
  # List all files in the folder
  files_in_folder <- drive_ls(as_id(folder_id))
  
  # Find the specific CSV file
  csv_file <- files_in_folder[files_in_folder$name == "yelp_academic_dataset_business.csv", ]
  
  # Check if the file is found
  if (nrow(csv_file) > 0) {
    
    # Use drive_download with a temporary file to avoid saving it locally
    temp_file <- tempfile(fileext = ".csv")
    
    # Stream the file into R as a dataframe
    drive_download(as_id(csv_file$id), path = temp_file, overwrite = TRUE)
    
    # Read the CSV directly into a dataframe from the temp file
    data_business <- read_csv(temp_file)
    
    # Return the dataframe
    return(data_business)
    
  } else {
    stop("The file 'yelp_academic_dataset_business.csv' was not found in the folder.")
  }
}

## TRANSFORMATION 
business_data <- import_data()

## OUTPUT
write.csv(business_data,"../../data/business_data.csv", append = FALSE, row.names = FALSE)