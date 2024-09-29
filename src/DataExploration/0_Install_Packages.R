#  List of required packages
list_of_packages <- c("ggplot2", "dplyr", "tidyr", "data.table", 
                      "googledrive", "stringr", "jsonlite", "readr", "writexl")

# Install any packages that are not already installed
new_packages <- list_of_packages[!(list_of_packages %in% installed.packages()[,"Package"])]
if (length(new_packages)) {
  install.packages(new_packages)
}
