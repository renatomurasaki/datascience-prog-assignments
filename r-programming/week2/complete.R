complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    datafilecases <- data.frame()
    
    for (idfile in id) {
        filename <- paste(formatC(idfile, width=3, flag=0),".csv", sep="")
        path <- paste(directory,"/", filename, sep="")
        data <- read.csv(path)
        cases <- data.frame(id = idfile, nobs = nrow(na.omit(data)))
        datafilecases <- rbind(datafilecases, cases)
    }
    
    return(datafilecases)
}