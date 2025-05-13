# Load necessary libraries
library(dplyr)
library(readxl)
library(janitor)

# Define a function to clean data
clean_data <- function(file_path, sheet = 1) {
  # Read the specified sheet from the Excel file into a data.frame
  data <- read_excel(file_path, sheet = sheet)
  
  # Clean column names and return the cleaned data.frame
  cleaned_data <- data %>%
    clean_names()
  
  return(cleaned_data)
}

# Example usage:
# cleaned_df <- clean_data("path_to_your_excel_file.xlsx", sheet = "Sheet1")
# print(cleaned_df)