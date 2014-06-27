## Load the Gross Domestic Product data for the 190 ranked countries in this data set: 
        
##        https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 

## Remove the commas from the GDP numbers in millions of dollars and average them. 
## What is the average? 

## Original data sources: http://data.worldbank.org/data-catalog/GDP-ranking-table




q4q2andq3 <- function(){
        
        URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
        if(!file.exists("./data/Q4GDP.csv")) {
                download.file(URL, destfile="./data/Q4GDP.csv")
        }
        GDP<-read.csv("./data/Q4GDP.csv", header=FALSE, sep=",", stringsAsFactors = FALSE, skip = 5)
        noCommas<-unlist(lapply(GDP[1:190,5], gsub, pattern = '[",]+', replacement = '', GDP[1:190,5]))
        print (mean(as.numeric(noCommas)))
        
##  In the data set from Question 2 what is a regular expression that would allow you to 
##  count the number of countries whose name begins with "United"? Assume that the variable 
##  with the country names in it is named countryNames. How many countries begin with United?
        countryNames <- GDP[1:190,4]

        print(grep("^United",countryNames))
        print(grep("*United",countryNames))
        print(grep("United$",countryNames))
        print(grep("*United",countryNames))

        
}