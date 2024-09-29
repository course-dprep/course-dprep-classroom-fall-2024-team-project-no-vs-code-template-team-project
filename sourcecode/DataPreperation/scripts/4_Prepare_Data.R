# Function to parse the attribute string into a named list
parse_attributes <- function(attr_string) {
  cleaned_string <- gsub("u'", "'", attr_string)
  cleaned_string <- gsub("'", "\"", cleaned_string)
  cleaned_string <- gsub("\\\\\"", "\"", cleaned_string)
  cleaned_string <- gsub('"(True|False)"', '\\L\\1', cleaned_string, perl = TRUE)
  cleaned_string <- gsub(": None", ": null", cleaned_string)
  cleaned_string <- gsub('(?<=:)\\s*""(.*?)""', '"\\1"', cleaned_string, perl = TRUE)
  cleaned_string <- paste0("{", str_remove_all(cleaned_string, "^\\{|\\}$"), "}")
  
  parsed_list <- tryCatch(fromJSON(cleaned_string), error = function(e) NULL)
  return(parsed_list)
}

# Function to prepare data and create dummy variables
prepare_data <- function(data) {
  # Parse attributes
  attributes_parsed <- data %>%
    mutate(attributes_list = lapply(attributes, parse_attributes)) %>%
    unnest_wider(attributes_list)
  
  # Convert attribute variables to dummy variables
  attributes_parsed <- attributes_parsed %>%
    mutate(across(everything(), as.character)) %>%
    mutate(across(starts_with("attribute_"), 
                  ~ recode(., 'NULL' = '0', 'FALSE' = '0', 'None' = '0', 
                           'TRUE' = '1')))
  
  # Rename specific attributes
  names(attributes_parsed)[names(attributes_parsed) == 'WiFi'] <- 'FreeWiFi'
  names(attributes_parsed)[names(attributes_parsed) == 'RestaurantAttire'] <- 'RestaurantCasualAttire'
  
  # Replace NAs with 0
  attributes_parsed[is.na(attributes_parsed)] <- '0'
  
  # Counting the frequency of attribute presence
  attributes_freq <- attributes_parsed %>%
    summarise(across(everything(), ~sum(. == "1"), .names = "{col}_1"))
  
  print(attributes_freq)
  
  return(attributes_parsed)  # Return the prepared data frame
}