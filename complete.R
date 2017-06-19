complete <-function(directory, id = 1:332) {
  files <- list.files(directory, full.names=TRUE)
  iddat <- vector()
  
  for (i in 1:length(id)) {
    currid <- read.csv(files[id[i]])
    iddat[i] <- sum(complete.cases(currid))
  }
  
  completedat <- data.frame(cbind(id,nobs=iddat))
  return(completedat)
}