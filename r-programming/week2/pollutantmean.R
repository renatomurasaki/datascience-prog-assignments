pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    
    allcols = data.frame()
    
    for (idfile in id) {
        filename <- paste(formatC(idfile, width=3, flag=0),".csv", sep="")
        path <- paste(directory,"/", filename, sep="")
        data <- read.csv(path)
        allcols <- rbind(allcols, data[pollutant])
    }
    
    return (round(colMeans(allcols, TRUE), 3))   
}