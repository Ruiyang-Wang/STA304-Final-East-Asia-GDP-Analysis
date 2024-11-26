#### Preamble ####
# Purpose: generate Models presented in the paper
# Author: Ruiyang Wang
# Date: 22th Nov 2024
# Contact: ruiyang.wang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

# Load necessary libraries
library(ggplot2)
library(dplyr)

# Set the directory for saving models
model_dir <- "~/STA304_Final/models"

# Ensure the directory exists
if (!dir.exists(model_dir)) {
  dir.create(model_dir, recursive = TRUE)
}

# GDP Per Capita Trends
gdp_trends <- ggplot(east_asia_data, aes(x = year, y = gdp_over_pop, color = country)) +
  geom_line() +
  labs(title = "GDP Per Capita Trends in East Asia",
       x = "Year", y = "GDP Per Capita", color = "Country") +
  theme_minimal()
saveRDS(gdp_trends, file.path(model_dir, "gdp_trends.rds"))

# Unemployment Rate Trends
unemployment_trends <- ggplot(east_asia_data, aes(x = year, y = unemployment_r, color = country)) +
  geom_line() +
  labs(title = "Unemployment Rate Trends in East Asia",
       x = "Year", y = "Unemployment Rate (%)", color = "Country") +
  theme_minimal()
saveRDS(unemployment_trends, file.path(model_dir, "unemployment_trends.rds"))

# Hours Worked Per Population Trends
hours_worked_trends <- ggplot(east_asia_data, aes(x = year, y = hours_worked_over_pop_combined, color = country)) +
  geom_line() +
  labs(title = "Hours Worked Per Population in East Asia",
       x = "Year", y = "Hours Worked Per Population", color = "Country") +
  theme_minimal()
saveRDS(hours_worked_trends, file.path(model_dir, "hours_worked_trends.rds"))

# Scatterplot for Population Aged 65+ vs GDP Per Capita
pop_over_65_vs_gdp <- ggplot(east_asia_data, aes(x = pop_over_65, y = gdp_over_pop, color = country)) +
  geom_point() +
  labs(title = "Population Aged 65+ vs GDP Per Capita",
       x = "Population Aged 65+ (%)", y = "GDP Per Capita", color = "Country") +
  theme_minimal()
saveRDS(pop_over_65_vs_gdp, file.path(model_dir, "pop_over_65_vs_gdp.rds"))

# Scatterplot for Youth Population vs Unemployment Rate
youth_vs_unemployment <- ggplot(east_asia_data, aes(x = pop_0_to_14, y = unemployment_r, color = country)) +
  geom_point() +
  labs(title = "Youth Population vs Unemployment Rate",
       x = "Youth Population (%)", y = "Unemployment Rate (%)", color = "Country") +
  theme_minimal()
saveRDS(youth_vs_unemployment, file.path(model_dir, "youth_vs_unemployment.rds"))

# Filter data for China
china_data <- east_asia_data %>%
  filter(country == "China")

# Filter data for other countries (exclude China)
other_countries_data <- east_asia_data %>%
  filter(country != "China")

# Plot for China
china_plot <- ggplot(china_data, aes(x = labor_force, y = gdp_over_pop, color = country)) +
  geom_point() +
  labs(title = "Labor Force Participation vs GDP Per Capita (China)",
       x = "Labor Force", y = "GDP Per Capita", color = "Country") +
  theme_minimal()
saveRDS(china_plot, file.path(model_dir, "china_plot.rds"))

# Plot for Other Countries
other_countries_plot <- ggplot(other_countries_data, aes(x = labor_force, y = gdp_over_pop, color = country)) +
  geom_point() +
  labs(title = "Labor Force Participation vs GDP Per Capita (Other East Asian Countries)",
       x = "Labor Force", y = "GDP Per Capita", color = "Country") +
  theme_minimal()
saveRDS(other_countries_plot, file.path(model_dir, "other_countries_plot.rds"))
