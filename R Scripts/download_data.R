#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Krishna Kumar
# Date: 16 September, 2024
# Contact: Krishna.Kumar@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

### workplace setup ###

#install.packages("opendatatoronto")
#install.packages("readr")

library("dplyr")
library("opendatatoronto")
library("readr")

### Download Data ###

toronto_ferry_counts <- 
  list_package_resources("toronto-island-ferry-ticket-counts") |>
  filter(name == 
             "Toronto Island Ferry Ticket Counts.csv") |>
  get_resource()

### Save Data ###

write_csv(
  x = toronto_ferry_counts, 
  file = "Data/Raw Data/Toronto Island Ferry Ticket Counts.csv"
)

head(toronto_ferry_counts)

slice(toronto_ferry_counts, 300:325)

read_csv("Data/Raw Data/Toronto Island Ferry Ticket Counts.csv")