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
    n_max = 100 # only first 100 rows to sample
  )