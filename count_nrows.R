count_rows <- function(filename) {
  
  rows_per_iteration <- 500000
  total_nrows <- 0
  this_nrow <- 0.1 # start with something above 0
  i <- 1
  
  while (this_nrow > 0) {
    
    section_i <-
      read_csv(
        file = filename,
        col_names =  F,
        col_types = cols(
          channelGrouping = col_skip(),
          customDimensions = col_skip(),
          date = col_skip(),
          device = col_skip(),
          fullVisitorId = col_character(),
          geoNetwork = col_skip(),
          hits = col_skip(),
          socialEngagementType = col_skip(),
          totals = col_skip(),
          trafficSource = col_skip(),
          visitId = col_integer(),
          visitNumber = col_integer(),
          visitStartTime = col_skip()
        ),
        skip = (i - 1) * rows_per_iteration,
        n_max = rows_per_iteration
      )
    
    this_nrow <- nrow(section_i)
    
    if (this_nrow > 0) {
      
      total_nrows <- total_nrows + nrow(section_i)
      i <- i + 1
      
    } else {
      
      return(total_nrows) 
      
    }
    
  }

}