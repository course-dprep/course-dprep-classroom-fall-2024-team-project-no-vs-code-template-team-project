# Cleaning up the attribute list 

library(jsonlite)

# Function to parse attribute strings into a list
parse_attributes <- function(attr_string) {
  cleaned_string <- gsub("u'", "'", attr_string) # Clean single quotes
  cleaned_string <- gsub("'", "\"", cleaned_string) # Replace single quotes with double quotes
  cleaned_string <- gsub("\\\\\"", "\"", cleaned_string) # Remove escape characters before quotes
  cleaned_string <- gsub('"(True|False)"', '\\L\\1', cleaned_string) # Convert True/False to lowercase
  cleaned_string <- gsub(": None", ": null", cleaned_string) # Replace None with null
  cleaned_string <- gsub('(?<=:)\\s*""(.*?)""', '"\\1"', cleaned_string, perl = TRUE)
  cleaned_string <- paste0("{", str_remove_all(cleaned_string, "^\\{|\\}$"), "}") # Enclose in curly braces
  
  # Attempt to parse
  parsed_list <- tryCatch(fromJSON(cleaned_string), error = function(e) NULL)
  return(parsed_list)
}

# Example of applying this function
# parsed_attributes <- data_business %>% mutate(attributes_list = lapply(attributes, parse_attributes)) %>% unnest_wider(attributes_list)