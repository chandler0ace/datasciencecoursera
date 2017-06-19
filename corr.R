corr <- function (directory, threshold = 0) {
  files <- list.files(directory, full.names=TRUE)
  allcomplete <- complete(directory)
  threshid <- allcomplete[allcomplete["nobs"] > threshold, ]$id
  corrdata <- numeric()
  
  for (i in threshid) {
    reRead <- read.csv(files[i])
    iddata <- reRead[complete.cases(reRead), ]
    corrdata <- c(corrdata, cor(iddata$sulfate, iddata$nitrate))
  }
  return(corrdata)
}

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