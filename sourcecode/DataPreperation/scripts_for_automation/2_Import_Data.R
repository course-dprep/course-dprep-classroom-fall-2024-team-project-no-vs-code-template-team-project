# Function to import data
import_data <- function() {
  library(googledrive)
  
  # Authenticate with Google Drive
  drive_dauth() i 
  
  folder_id <- "1ioJVCsr5pJ5tAa2dPJ9yxIvL6rYmDSl1"
  files_in_folder <- drive_ls(as_id(folder_id))
  
  # Retrieve the CSV file
  csv_file <- files_in_folder[files_in_folder$name == "yelp_academic_dataset_business.csv", ]
  
  if (nrow(csv_file) > 0) {
    drive_download(as_id(csv_file$id), path = "data/yelp_academic_dataset_business.csv", overwrite = TRUE)
    cat("File downloaded successfully.
")
  } else {
    stop("The file 'yelp_academic_dataset_business.csv' was not found in the folder.")
  }
  
  data_business <- read_csv("data/yelp_academic_dataset_business.csv")
  return(data_business)  # Return the data frame
}