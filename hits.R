library(tidyverse)
library(jsonlite)
library(stringr)

setwd("C:/Users/gleas/Google Drive/Coding/R/")

# test test test

# Load data -----------

gstore <-
  read_csv(
    file = "train_v2.csv",
    col_names =  T,
    n_max = 100 # only first 100 rows to sample
  )

# Helper functions -----------

fix_json_string <-
  function(s) {
    s %>% # s is a string
      str_replace_all(pattern = '"', replacement = "'") %>% 
      str_replace_all(
        pattern = "'(?![:alpha:])|(?<=[:space:]|[:punct:])'", 
        # PATTERN: 
        #    single quote followed by a letter 
        #    OR single quote preceded by a space/punctuation
        replacement = '"'
      ) %>%
      str_replace_all(pattern = "True", replacement = '"TRUE"') %>%
      str_replace_all('" : "', '":"') %>%
      str_replace_all('(?<!: )"(?= |é)', "")
  }

# Apply json string fix -----------

gstore2 <-
  gstore %>%
  select(fullVisitorId, visitStartTime, hits) %>%
  mutate(
    fixed_json_string = fix_json_string(hits),
    hits_object = map(fixed_json_string, fromJSON)
  )

gstore3 <-
  gstore2 %>%
  mutate(
    page_hits = map(hits_object, "page"),
    pages_pagePaths = map(page_hits, "pagePath")
  ) 

