#### Preamble ####
# Purpose: Simulates the dataset
# Author: Ruiyang Wang
# Date: 24th Nov 2024
# Contact: ruiyang.wang@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? None


# Load necessary libraries
library(tidyverse)

# Set seed for reproducibility
set.seed(42)

# Define the number of rows to simulate
n_rows <- 100  # Adjust as needed

# Generate simulated data
simulated_data <- tibble(
  year = sample(1990:2023, n_rows, replace = TRUE),
  country = sample(
    c("China", "Japan", "Korea, Rep.", "Korea, Dem. People's Rep.", "Macao SAR, China", "Hong Kong SAR, China", "Mongolia"),
    n_rows, replace = TRUE
  ),
  pop = runif(n_rows, min = 500000, max = 1500000000),  # Random population values
  labor_force = runif(n_rows, min = 100000, max = 800000000),  # Random labor force values
  gdp = runif(n_rows, min = 1e9, max = 1e13),  # Random GDP values
  unemployment_r = runif(n_rows, min = 0.5, max = 10),  # Random unemployment rates
  pop_over_65 = runif(n_rows, min = 1, max = 25),  # Random percentage of population over 65
  gdp_over_pop = runif(n_rows, min = 100, max = 80000),  # Random GDP per capita
  continent = 3,  # Fixed for Asia
  hours_worked_over_pop_combined = runif(n_rows, min = 500, max = 2500),  # Random hours worked
  pop_0_to_14 = runif(n_rows, min = 10, max = 30),  # Random percentage of population under 14
  pop_15_to_64 = runif(n_rows, min = 50, max = 70),  # Random percentage of working-age population
  gdp_ppp_c = runif(n_rows, min = 1e9, max = 1e13),  # Random PPP-adjusted GDP
  gdp_ppp = runif(n_rows, min = 1e9, max = 1e13),  # Random PPP GDP values
  gdp_c = runif(n_rows, min = 1e9, max = 1e13)  # Random GDP values
)

# Save the simulated dataset to the specified path
write_csv(simulated_data, "~/STA304_Final/data/00-simulated_data/simulated_data.csv")



# Debugging after the test simulated_data
# Load the dataset
debugging_data <- read_csv("~/STA304_Final/data/00-simulated_data/simulated_data.csv")

# Recalculate gdp_over_pop based on gdp and pop
debugging_data <- debugging_data %>%
  mutate(
    gdp_over_pop_fixed = gdp / pop,
    difference = abs(gdp_over_pop - gdp_over_pop_fixed)
  )

# Summary of differences before fixing
summary(debugging_data$difference)

# Replace original gdp_over_pop with the recalculated values
debugging_data <- debugging_data %>%
  mutate(gdp_over_pop = gdp_over_pop_fixed)

# Verify the fix by checking differences after replacement
debugging_data <- debugging_data %>%
  mutate(difference_fixed = abs(gdp_over_pop - gdp / pop))

# Check the maximum difference after the fix
max_difference_fixed <- max(debugging_data$difference_fixed, na.rm = TRUE)
print(paste("Maximum difference after fixing:", max_difference_fixed))

# Save the corrected dataset
write_csv(debugging_data, "~/STA304_Final/data/00-simulated_data/simulated_data.csv")

