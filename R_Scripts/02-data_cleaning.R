#### Preamble ####
# Purpose: Cleans the raw data acquired from Open Data Toronto
# into an analysis data set.
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

toronto_ferry_counts <-read_csv("Data/Raw_Data/Toronto Island Ferry Ticket Counts.csv")

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

### Filtering the data set to make the start date January 1st, 2018 
### and end date September 20th, 2024

cleaned_ticket_counts_data <- cleaned_ticket_counts_data %>%
  filter(Date >= as.Date("2018-01-01") & Date <= as.Date("2024-09-20"))

### Checking new column names
#names(cleaned_ticket_counts_data)

### Cleaned data set
head(cleaned_ticket_counts_data)
tail(cleaned_ticket_counts_data)


### Saving the cleaned data set
write_csv(
  x = cleaned_ticket_counts_data,
  file = "Data/Analysis_Data/cleaned_ticket_counts_data.csv"
)



  ### Testing the cleaned data ###
  
  # Reading the cleaned data
  cleaned_data <- read_csv("Data/Analysis_Data/cleaned_ticket_counts_data.csv")

# Testing for negative numbers
min(cleaned_data$Tickets_Redeemed) >= 0  
min(cleaned_data$Tickets_Sold) >= 0  

# Testing for NAs
all(is.na(cleaned_data$Tickets_Redeemed))  
all(is.na(cleaned_data$Tickets_Sold))  

# Testing for starting year
cleaned_data$Year <- as.integer(format(cleaned_data$Date, "%Y"))
min(cleaned_data$Year) >= 2018  # Ensure the minimum year is 2018

# Testing for all the unique years in the cleaned data
unique(cleaned_data$Year)
