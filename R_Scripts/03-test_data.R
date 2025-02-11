#### Preamble ####
# Purpose: Tests the data set to check the validity of entries
# Author: Krishna Kumar
# Date: 20 September 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: Need to have the simulated data
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

min(data$year) >= 2018  

# Testing for all the unique years

unique(data$year)
