# Load required packages
library(readxl)
library(janitor)

clean_data <- function(file_path, sheet = 1) {
  # Check if file exists
  if (!file.exists(file_path)) {
    stop("File does not exist")
  }
  
  # Read the Excel file with sheet parameter
  data <- read_excel(file_path, sheet = sheet)
  
  # Clean column names using janitor
  cleaned_data <- data %>%
    clean_names()
    
  return(cleaned_data)
}