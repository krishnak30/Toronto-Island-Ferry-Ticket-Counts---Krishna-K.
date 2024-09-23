#### Preamble ####
# Purpose: Testing the dataset... [ADD MORE HERE]
# Author: Krishna Kumar
# Date: 20 September 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: Need to have simulated data
# Any other information needed? None.


#### Workspace setup ####
library(tidyverse)

### Testing the data ###

data <- read_csv("Data/Raw_Data/simulated_data.csv")

# Testing for negative numbers
data$redemption_tickets |> min() <= 0
data$sales_tickets |> min() <= 0

# Testing for NAs

all(is.na(data$redemption_tickets))
all(is.na(data$sales_tickets))


unique(data$year)

# Testing for starting year
data$year <- as.integer(format(as.Date(data$timestamp), "%Y"))

min(data$year) >= 2015  # Adjust as necessary

# Testing for all the unique years

unique(data$year)
