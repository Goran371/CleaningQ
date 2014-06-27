## Load the Gross Domestic Product data for the 190 ranked countries in this data set: 
        
##        https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 

## Load the educational data from this data set: 
        
##        https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 

## Match the data based on the country shortcode. Of the countries for which the end of the fiscal year is available, how many end in June? 

## Original data sources: 
##      http://data.worldbank.org/data-catalog/GDP-ranking-table 
##      http://data.worldbank.org/data-catalog/ed-stats

q4q4 <- function(){
        
        GDPURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
        if(!file.exists("./data/Q4Q4GDP.csv")) {
                download.file(GDPURL, destfile="./data/Q4Q4GDP.csv")
        }
        GDP<-read.csv("./data/Q4GDP.csv", header=FALSE, sep=",", stringsAsFactors = FALSE, skip = 5)
        
        eduURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
        if(!file.exists("./data/eduGDP.csv")) {
                download.file(eduURL, destfile="./data/eduGDP.csv")
        }
        EDU<-read.csv("./data/eduGDP.csv", header=TRUE, sep=",", stringsAsFactors = FALSE)
        
        matching <-match(GDP[,1], EDU[,1])
        ## matching contains: for each z in matching, GDP[z,1] matches EDU[matching[z],1]
        l<- length(matching)
        count <- 0
        for(i in 1:l){
                ## info on fiscal year ending is in EDU, column 10 (Special Notes)
                if(!is.na(matching[i])) {
                        note <- EDU[matching[i],10] 
                        if (any(grep("^Fiscal year end:", note)==1)) {
                                if(any(grep("June", note))) {
                                        if(grep("June", note)==1) {
                                                count <- count+1
                                        }
                                }
                        }
                }
                
        }
        count
}
