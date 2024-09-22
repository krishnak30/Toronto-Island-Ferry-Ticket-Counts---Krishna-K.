#### Preamble ####
# Purpose: Cleans the raw data recorded for redemption and sales ticket counts
# and make the data easier to comprehend
# Author: Krishna Kumar
# Date: September 17th, 2024
# Contact: krishna.kumar@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have the downloaded data
# Any other information needed? None

### Workplace Setup ###
library(tidyverse)
library(janitor)
library(lubridate)

toronto_ferry_counts <-read_csv("Data/Raw Data/Toronto Island Ferry Ticket Counts.csv")

### Cleaning column names
cleaned_ticket_counts_data <-
  clean_names(toronto_ferry_counts)

### Looking at cleaned names
head(cleaned_ticket_counts_data)

### converting 'dbl' columns to 'int' 
### since all the values are whole numbers
cleaned_ticket_counts_data <- cleaned_ticket_counts_data |>
  mutate(
    x_id = as.integer(x_id),  # Convert x_id to integer
    redemption_count = as.integer(redemption_count),  # Convert redemption_count to integer
    sales_count = as.integer(sales_count)  # Convert sales_count to integer
  )

### Looking at new columns
head(cleaned_ticket_counts_data)

# Separating the dttm column into two date and time columns
cleaned_ticket_counts_data <- cleaned_ticket_counts_data |>
  separate(
    col = timestamp,  
    into = c("date", "time"), 
    sep = " "
  )

# Converting Date column to date class
cleaned_ticket_counts_data <- cleaned_ticket_counts_data |>
  mutate(Date = as.Date(date))

### Removing any duplicate columns, if present
cleaned_ticket_counts_data <- cleaned_ticket_counts_data %>%
  select(-date)

### Renaming columns for better understanding
cleaned_ticket_counts_data <-
  cleaned_ticket_counts_data |>
  rename(
    ID = x_id,
    Time = time,
    Tickets_Redeemed = redemption_count,
    Tickets_Sold = sales_count,
  )


### Checking new column names
names(cleaned_ticket_counts_data)

### Cleaned data set
head(cleaned_ticket_counts_data)



### Saving the cleaned data set
write_csv(
  x = cleaned_ticket_counts_data,
  file = "Data/Analysis Data/cleaned_ticket_counts_data.csv"
)


