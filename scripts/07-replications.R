#### Preamble ####
# Purpose: Replicated graphs and data processes in the paper
# Author: Ruiyang Wang
# Date: 22th Nov 2024
# Contact: ruiyang.wang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


# Setups
install.packages("car")
install.packages("lmtest")
library(tidyverse)
library(ggplot2)
library(reshape2)
library(car)
library(lmtest)
east_asia_data <- read_csv("~/STA304_Final/data/02-analysis_data/analysis_data.csv")

# Data Overview
# GDP Per Capita Trends
ggplot(east_asia_data, aes(x = year, y = gdp_over_pop, color = country)) +
  geom_line() +
  labs(title = "GDP Per Capita Trends in East Asia",
       x = "Year", y = "GDP Per Capita", color = "Country") +
  theme_minimal()

# Unemployment Rate Trends
ggplot(east_asia_data, aes(x = year, y = unemployment_r, color = country)) +
  geom_line() +
  labs(title = "Unemployment Rate Trends in East Asia",
       x = "Year", y = "Unemployment Rate (%)", color = "Country") +
  theme_minimal()

# Hours Worked Per Population Trends
ggplot(east_asia_data, aes(x = year, y = hours_worked_over_pop_combined, color = country)) +
  geom_line() +
  labs(title = "Hours Worked Per Population in East Asia",
       x = "Year", y = "Hours Worked Per Population", color = "Country") +
  theme_minimal()

# Scatterplot for Pop Over 65 vs GDP Per Capita
ggplot(east_asia_data, aes(x = pop_over_65, y = gdp_over_pop, color = country)) +
  geom_point() +
  labs(title = "Population Aged 65+ vs GDP Per Capita",
       x = "Population Aged 65+ (%)", y = "GDP Per Capita", color = "Country") +
  theme_minimal()

# Scatterplot for Youth Population vs Unemployment Rate
ggplot(east_asia_data, aes(x = pop_0_to_14, y = unemployment_r, color = country)) +
  geom_point() +
  labs(title = "Youth Population vs Unemployment Rate",
       x = "Youth Population (%)", y = "Unemployment Rate (%)", color = "Country") +
  theme_minimal()

# Filter data for China
china_data <- east_asia_data %>%
  filter(country == "China")

# Filter data for other countries (exclude China)
other_countries_data <- east_asia_data %>%
  filter(country != "China")

# Plot for China
ggplot(china_data, aes(x = labor_force, y = gdp_over_pop, color = country)) +
  geom_point() +
  labs(title = "Labor Force Participation vs GDP Per Capita (China)",
       x = "Labor Force", y = "GDP Per Capita", color = "Country") +
  theme_minimal()

# Plot for Other Countries
ggplot(other_countries_data, aes(x = labor_force, y = gdp_over_pop, color = country)) +
  geom_point() +
  labs(title = "Labor Force Participation vs GDP Per Capita (Other East Asian Countries)",
       x = "Labor Force", y = "GDP Per Capita", color = "Country") +
  theme_minimal()


# LR models with SLR, MLR, and interaction terms
# Simple Linear Regression
simple_model <- lm(gdp_over_pop ~ year, data = east_asia_data)
summary(simple_model)

# Residual Diagnostics for the Simple Linear Regression Model
par(mfrow = c(2, 2))
plot(simple_model)

# Multiple Linear Regression
multiple_model <- lm(gdp_over_pop ~ unemployment_r + labor_force + pop_over_65 + hours_worked_over_pop_combined, 
                     data = east_asia_data)
summary(multiple_model)

# Residual Diagnostics for the Multiple Linear Regression Model
par(mfrow = c(2, 2))
plot(multiple_model)

# Check for multicollinearity using VIF
vif(multiple_model)

# Test for independence of errors
dwtest(multiple_model)

# Multiple Linear Regression with Interaction Terms
interaction_model <- lm(gdp_over_pop ~ pop_15_to_64 * labor_force, data = east_asia_data)
summary(interaction_model)

# Residual Diagnostics for the Interaction Model
par(mfrow = c(2, 2))
plot(interaction_model)

# Check for multicollinearity using VIF
vif(interaction_model)

# Test for independence of errors
dwtest(interaction_model)



