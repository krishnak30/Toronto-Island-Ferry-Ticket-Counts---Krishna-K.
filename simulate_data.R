#### Preamble ####
# Purpose: Obtain and prepare data about Toronto Island's Ferry counts
# for 
# Author: Krishna Kumar
# Date: 16 September, 2024
# Contact: krishna.kumar@mail.utoronto.ca
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? 

### Workplace Setup ###

library("tidyverse")
library("janitor")
library("ggplot2")
library("knitr")
library("opendatatoronto")
library("dplyr")

### Simulating ###

set.seed(420)

simulated_ticket_data_2022 <-
  tibble(
    timestamp = rep(x = as.Date("2022-01-01") + c(0:364), times = 1),
    redemption_tickets = 
      rpois(
        n = 365,
        lambda = 30 ##idk why I used 30###
      ),
    sales_tickets = 
      rpois(
        n = 365,
        lambda = 30 ##idk why I used 30###
  ),
  )

simulated_ticket_data_2023 <-
  tibble(
    timestamp = rep(x = as.Date("2023-01-01") + c(0:364), times = 1),
    redemption_tickets = 
      rpois(
        n = 365,
        lambda = 30 ##idk why I used 30###
      ),
    sales_tickets = 
      rpois(
        n = 365,
        lambda = 30 ##idk why I used 30###
      ),
  )

new_data <- (bind_rows(simulated_ticket_data_2022, simulated_ticket_data_2023))

head(new_data)
tail(new_data)

        
    