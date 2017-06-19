pollutantmean <- function(directory, pollutant, id = 1:332) {
  files <- list.files(directory, full.names=TRUE)
  pollutdat <- data.frame()
  
  for (i in id) {
    pollutdat <- rbind(pollutdat, read.csv(files[i]))
  }
  
  mean(pollutdat[, pollutant], na.rm=TRUE)
}

