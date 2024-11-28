#### Preamble ####
# Purpose: Downloads and saves the data from The Economists
# Author: Ruiyang Wang
# Date: 22th Nov 2024
# Contact: ruiyang.wang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

library(tidyverse)
library(here)

# Define the URL of the raw dataset
url <- "https://raw.githubusercontent.com/TheEconomist/the-economist-gdp-per-hour-estimates/main/output-data/gdp_over_hours_worked_with_estimated_hours_worked.csv"

# Define the directory path using here() for reproducibility
dir_path <- here("data", "01-raw_data")

# Define the new filename
new_file_name <- "raw_data.csv"

# Full path for the renamed file
local_path <- file.path(dir_path, new_file_name)

# Check if the directory exists; if not, create it
dir.create(dir_path, recursive = TRUE, showWarnings = FALSE)

# Download the dataset and save it to the specified location
download.file(url, destfile = local_path)

# Confirm the file has been saved
if (file.exists(local_path)) {
  cat("File successfully saved as 'raw_data.csv' at:", local_path, "\n")
} else {
  cat("Failed to save the file. Check the URL or path.\n")
}

# Optionally read the dataset into R
dataset <- read.csv(local_path)
