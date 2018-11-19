library(tidyverse)
library(devtools)
library(jsonlite)
library(stringr)
library(janitor)

setwd("C:/Users/gleas/Google Drive/Coding/R/")

# Data processing -----------

gstore <-
  read_csv(
    file = "train_v2.csv",
    col_names =  T,
    col_types = cols(
      channelGrouping = col_character(),
      customDimensions = col_character(),
      date = col_integer(),
      device = col_character(),
      fullVisitorId = col_character(),
      geoNetwork = col_character(),
      hits = col_character(),
      socialEngagementType = col_character(),
      totals = col_character(),
      trafficSource = col_character(),
      visitId = col_integer(),
      visitNumber = col_integer(),
      visitStartTime = col_integer()
    ),
    n_max = 100 # only first 100 rows to sample
  )