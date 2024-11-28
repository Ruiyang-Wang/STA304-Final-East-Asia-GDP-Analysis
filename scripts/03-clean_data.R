#### Preamble ####
# Purpose: Cleans the raw plane data
# Author: Ruiyang Wang
# Date: 22 Nov 2024
# Contact: Ruiyang Wang
# License: MIT
# Pre-requisites: None
# Any other information needed? None

library(tidyverse)
library(readr)
library(dplyr)
library(here)
library(arrow)


raw_data <- read_csv(here("data/01-raw_data/raw_data.csv"))

cleaned_data <- raw_data %>%
  filter(
    !is.na(country) & 
      !is.na(labor_force) & 
      continent == 3 & 
      country %in% c(
        "China", "Japan", "Mongolia", 
        "Korea, Dem. People's Rep.", "Korea, Rep.", 
        "Macao SAR, China", "Hong Kong SAR, China"
      )
  ) %>%
  select(
    year, country, pop, labor_force, gdp, unemployment_r, pop_over_65, 
    gdp_over_pop, continent, hours_worked_over_pop_combined, 
    pop_0_to_14, pop_15_to_64, gdp_ppp_c, gdp_ppp, gdp_c
  )

#### Save data ####
write_csv(cleaned_data, here("data/02-analysis_data/analysis_data.csv"))
write_parquet(cleaned_data, here("data/02-analysis_data/analysis_data.parquet"))
