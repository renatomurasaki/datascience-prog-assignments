corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    
    completecases <- complete("specdata")
    setofcases <- subset(completecases, nobs > threshold)
    correlations <- c()
    
    for(i in setofcases$id){
        filename <- paste(formatC(i, width=3, flag=0),".csv", sep="")
        path <- paste(directory,"/", filename, sep="")
        data <- read.csv(path)
        xy <- subset(data, !is.na(sulfate) & !is.na(nitrate))
        correlations[i] <- cor(xy$sulfate, xy$nitrate)
    }
    
    return(na.omit(correlations))
    
}