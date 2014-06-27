## Quizz 4 Question 1
## The American Community Survey distributes downloadable data about United States communities.
## Download the 2006 microdata survey about housing for the state of Idaho using download.file()
## from here:  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv

q4q1 <- function(){
        
        URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
        if(!file.exists("./data/housingsurvey.csv")) {
                download.file(URL, destfile="./data/housingsurvey.csv")
        }
        df <-read.table("./data/housingsurvey.csv", sep=",",header=TRUE)
        hd <- names(df)
        lis <- lapply(hd, strsplit, "wgtp")
        return(lis[[123]])
        
}