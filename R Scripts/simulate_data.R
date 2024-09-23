#### Preamble ####
# Purpose: Obtain and prepare data about Toronto Island's Ferry counts
# for 
# Author: Krishna Kumar
# Date: 16 September, 2024
# Contact: krishna.kumar@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? 

### Workplace Setup ###

library("tidyverse")
library("knitr")
library("dplyr")

### Simulating ###


set.seed(420)

## Setting a start and end date

start_date <- as.Date("2015-01-01")
end_date <- Sys.Date()  # Current date
num_days <- as.numeric(end_date - start_date) + 1 

simulated_ticket_data <-
  tibble(
    timestamp = start_date + c(0:num_days),
    redemption_tickets = 
      rpois(
        n = num_days + 1,
        lambda = 48 ### 48 was the average of the redemption counts###
      ),
    sales_tickets = 
      rpois(
        n = num_days + 1,
        lambda = 49 ### 49 was the average of the redemption counts###
      ),
  )

head(simulated_ticket_data)
tail(simulated_ticket_data)

### Saving the simulated data ###

write_csv(simulated_ticket_data, file = "Data/Raw_Data/simulated_data.csv")


