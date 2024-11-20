#  List of required packages
list_of_packages <- c('readr', 'data.table')

# Install any packages that are not already installed
new_packages <- list_of_packages[!(list_of_packages %in% installed.packages()[,"Package"])]
if (length(new_packages)) {
  install.packages(new_packages)
}
