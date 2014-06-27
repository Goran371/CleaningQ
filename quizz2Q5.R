

## https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for 

q2q5 <- function(){
        library(data.table)
##        URL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
##        destfile=".\\data\\q2q5.csv"
##        if(!file.exists(destfile)){
##                download.file(URL, destfile)
##        }
##        DT<-fread(destfile, sep=",",header=TRUE)
##        col4sum <-sum(DT[4,], na.rm=TRUE)
wksst <- read.fwf("http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for",skip = 4, widths = c(12,7,4,9,4,9,4,9,4)) 
print(sum(wksst[1:1254,4]))
wksst1 <- read.fwf("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for",skip = 4, widths = c(12,7,4,9,4,9,4,9,4)) 
print(sum(wksst1[1:1254,4]))
##        data <- read.csv(destfile, header=TRUE, skip=1)
##        for (i in 1:1255){
##                line <- strsplit(as.character(data[i,]), "     ",fixed = TRUE)  
##        }
        
        a =0
}