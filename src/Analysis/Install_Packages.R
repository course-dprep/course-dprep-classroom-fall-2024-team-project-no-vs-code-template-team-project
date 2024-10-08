#  List of required packages
list_of_packages <- c('readr', 'dplyr', 'rmarkdown', 'data.table', 'broom',
                      'knitr', 'ggplot2', 'effectsize', 'emmeans')

# Install any packages that are not already installed
new_packages <- list_of_packages[!(list_of_packages %in% installed.packages()[,"Package"])]
if (length(new_packages)) {
  install.packages(new_packages)
}
