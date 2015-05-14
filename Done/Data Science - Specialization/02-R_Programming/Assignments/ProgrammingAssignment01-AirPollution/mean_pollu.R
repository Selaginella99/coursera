pollutantmean <- function(directory, pollutant, id = 1:332) {
	  filelist <- list.files(directory)
	  path.file <- paste("specdata/", filelist, sep = "") # path.file <- paste0("specdata/", filelist)
	
	  output <- data.frame()
		for (i in id){
		temp <- read.csv(path[i], head = T)
		output <- rbind(output, temp)
		}
  
	  pollutant <- output[,pollutant]
	  poll.mean <- mean(pollutant, na.rm = TRUE)
	
	  options(digits = 4)
	  return(poll.mean)
}

pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    files <- list.files(directory, full.names = TRUE)
    data <- lapply(files, read.csv)	
	
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    output.list <- data[id]
    output <- do.call(rbind, output.list)
    
#    output <- data.frame()
#    for (i in id){
#        output <- rbind(output, data[[i]])
#    } 
	 
    subset <- output[, pollutant]
    pollutant.mean <- mean(subset, na.rm=TRUE)
	   
    round(pollutant.mean, 3)
}
