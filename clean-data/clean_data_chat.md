
# R dplyr pipeline for cleaning Excel data (2025-05-13 08:40:18)

_**User**_

In the clean-data folder, write an R dplyr pipeline file that:
- reads an excel file to a data.frame
- transforms the data.frame column names using clean_names()
- returns the cleaned data.frame

---

_**Assistant**_

Here is an R script that uses the `dplyr` package along with the `readxl` and `janitor` packages to achieve the requested functionality.

```r
# Load necessary libraries
library(dplyr)
library(readxl)
library(janitor)

# Define a function to clean data
clean_data <- function(file_path) {
  # Read the Excel file into a data.frame
  data <- read_excel(file_path)
  
  # Clean column names and return the cleaned data.frame
  cleaned_data <- data %>%
    clean_names()
  
  return(cleaned_data)
}

# Example usage:
# cleaned_df <- clean_data("path_to_your_excel_file.xlsx")
# print(cleaned_df)
```

### Instructions:
1. Save this script in the `` folder as `clean_data_pipeline.R`.
2. Replace `"path_to_your_excel_file.xlsx"` with the actual path to your Excel file when calling the `clean_data()` function.
3. Ensure you have the `readxl` and `janitor` packages installed. You can install them using:
   ```r
   install.packages("readxl")
   install.packages("janitor")
   ```

---

_**User**_

add sheet name or number as an input

---

_**Assistant**_

Here is the updated R script that includes the sheet name or number as an input:

```r
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
```

### Updates:
- Added a `sheet` parameter to the `clean_data()` function. This can accept either the sheet name (e.g., `"Sheet1"`) or the sheet number (e.g., `1`).
- The `sheet` parameter is passed to the `read_excel()` function to specify which sheet to read.

### Instructions:
1. Save this updated script in the `` folder as `clean_data_pipeline.R`.
2. When calling the `clean_data()` function, specify the sheet name or number as needed. For example:
   ```r
   cleaned_df <- clean_data("path_to_your_excel_file.xlsx", sheet = 2)
   ```

---

_**User**_

make a test that loads "Example_clinical_datasheet.xlsx" and checks the number of rows

---

_**Assistant**_

Here is an example test script to load the `Example_clinical_datasheet.xlsx` file and check the number of rows:

```r
# Load necessary libraries
library(testthat)

# Source the clean_data function
source("clean_data_pipeline.R")

# Define the test
test_that("clean_data correctly loads and checks the number of rows", {
  # Path to the example Excel file
  file_path <- "Example_clinical_datasheet.xlsx"
  
  # Load the cleaned data
  cleaned_df <- clean_data(file_path, sheet = 1)
  
  # Check the number of rows (replace 100 with the expected number of rows)
  expected_rows <- 100  # Update this value based on the actual data
  expect_equal(nrow(cleaned_df), expected_rows)
})
```

### Instructions:
1. Save this script as `test_clean_data.R` in the `` folder.
2. Replace `100` in `expected_rows` with the actual number of rows in your `Example_clinical_datasheet.xlsx` file.
3. Run the test using the `testthat` package:
   ```r
   library(testthat)
   test_file("test_clean_data.R")
   ```
4. Ensure the `Example_clinical_datasheet.xlsx` file is in the same directory or provide the correct path to it.
