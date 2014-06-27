explorefiles <- function(file) {
        ## just to start sudy the data files in debug mode
        directory <-"../Getting and Cleaning Data/projectfiles/UCI HAR Dataset/"
        filename<-paste(directory,file,sep="")
        if(!file.exists(filename)){
                print("file does not exist")
                return(-1)
        }
        content <- read.table(filename, sep=",",header=FALSE)
        
        return(0)
}