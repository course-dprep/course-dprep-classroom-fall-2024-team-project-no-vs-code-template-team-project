# install and import needed packages 

#  List of required packages
list_of_packages <- c("ggplot2", "dplyr", "tidyr", "knitr", 
                      "googledrive", "stringr", "jsonlite", "readr", "gt")

# Install any packages that are not already installed
new_packages <- list_of_packages[!(list_of_packages %in% installed.packages()[,"Package"])]
if (length(new_packages)) {
  install.packages(new_packages)
}

# Load libraries
lapply(list_of_packages, library, character.only = TRUE)
