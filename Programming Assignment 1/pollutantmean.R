# Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. 
# The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. 
# Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the directory specified in the 'directory' 
# argument and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA.

pollutantmean <- function(directory, pollutant, id = 1:332){
  # Get a list of filenaems
  filesnames <- list.files(path = directory, pattern = "*.csv")
  
  # Initialize a vector
  vals <- vector()
  
  for (i in id){
    filename <- sprintf("%03d.csv", i)
    filepath <- paste(directory, filename, sep = '/')
    
    data <- read.csv(filepath)
    
    d <- data[, pollutant]
    
    d <- d[!is.na(d)]
    
    vals <- c(vals, d)
  }
  
  mean(vals)
  
}