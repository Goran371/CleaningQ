bb_restaurant <- function(){
        
        URL4 <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml" 
        doc <- xmlTreeParse(URL4, useInternal=TRUE)
        rn<-xmlRoot(doc)
        
        j<-0
        i=1
        zipcodes <-xpathSApply(rn,"//zipcode",xmlValue)
        while(!is.na(zipcodes[i])){
                if(zipcodes[i]=="21231"){
                        j<-j+1
                }
                i<-i+1
        }
        j
}