# Load necessary libraries
library(testthat)

# Source the clean_data function
source("clean_data.R")

# Define the test
test_that("clean_data correctly loads and checks the number of rows", {
  # Path to the example Excel file
  file_path <- "Example_clinical_datasheet.xlsx"
  
  # Load the cleaned data
  cleaned_df <- clean_data(file_path, sheet = 1)
  
  # Check the number of rows (replace 100 with the expected number of rows)
  expected_rows <- 8  # Update this value based on the actual data
  expect_equal(nrow(cleaned_df), expected_rows)
})