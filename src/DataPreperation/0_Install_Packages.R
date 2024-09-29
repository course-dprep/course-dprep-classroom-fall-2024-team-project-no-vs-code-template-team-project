# List of required packages
list_of_packages <- c("googledrive", "dplyr", 
                      "data.table", "jsonlite", "stringr")

# Install any packages that are not already installed
new_packages <- list_of_packages[!(list_of_packages %in% installed.packages()[,"Package"])]
if (length(new_packages)) {
  install.packages(new_packages)
}
