#### Preamble ####
# Purpose: Tests for the analysis data
# Author: Ruiyang Wang
# Date: 22th Nov 2024
# Contact: ruiyang.wang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


library(testthat)
library(tidyverse)

# Load the analysis dataset
analysis_data <- read_csv("~/STA304_Final/data/02-analysis_data/analysis_data.csv")

# Test if all expected columns are present
test_that("Dataset contains all expected columns", {
  # Check that all required columns exist in the dataset
  expected_columns <- c(
    "year", "country", "pop", "labor_force", "gdp", "unemployment_r",
    "pop_over_65", "gdp_over_pop", "continent", "hours_worked_over_pop_combined",
    "pop_0_to_14", "pop_15_to_64", "gdp_ppp_c", "gdp_ppp", "gdp_c"
  )
  expect_true(all(expected_columns %in% colnames(analysis_data)))
})

# Test if critical columns have no missing values
test_that("Critical columns have no missing values", {
  # Ensure that critical columns (e.g., year, gdp) do not contain NA values
  critical_columns <- c("year", "country", "pop", "unemployment_r", "hours_worked_over_pop_combined")
  expect_true(all(complete.cases(analysis_data[critical_columns])))
})

# Test if year values are within the valid range
test_that("Year is within valid range", {
  # Confirm that all years are between 1990 and 2023
  expect_true(all(analysis_data$year >= 1990 & analysis_data$year <= 2023))
})

# Test if percentage columns have values between 0 and 100
test_that("Percentage columns are between 0 and 100", {
  # Check that percentage-based columns fall within the range 0 to 100
  percentage_columns <- c("pop_over_65", "pop_0_to_14", "pop_15_to_64")
  for (col in percentage_columns) {
    expect_true(all(analysis_data[[col]] >= 0 & analysis_data[[col]] <= 100, na.rm = TRUE))
  }
})


# Test if GDP per capita values are consistent with gdp and pop
test_that("GDP per capita values are consistent", {
  # Ensure gdp_over_pop matches the calculated value of gdp / pop with a small tolerance
  analysis_data <- analysis_data %>%
    mutate(calculated_gdp_over_pop = gdp / pop)
  expect_true(all(abs(analysis_data$gdp_over_pop - analysis_data$calculated_gdp_over_pop) <= 0.01, na.rm = TRUE))
})


# Test if all continent values are correctly labeled as Asia (3)
test_that("Continent values are correctly labeled as Asia (3)", {
  # Validate that the continent column contains only the value 3
  expect_true(all(analysis_data$continent == 3))
})

# Notify that all tests have been completed
message("All tests for the analysis dataset have been completed.")

