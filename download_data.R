#### Preamble ####
# Purpose: Downloads and saves the data from OpenDataToronto
# Author: Krishna Kumar
# Date: 16 September, 2024
# Contact: Krishna.Kumar@mail.utoronto.ca
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

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
  file = "Toronto Island Ferry Ticket Counts.csv"
)

head(toronto_ferry_counts)

read_csv(
  "Toronto Island Ferry Ticket Counts.csv",
  show_col_types = FALSE
)
