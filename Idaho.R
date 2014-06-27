Idaho <- function() {
        fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
        
        download.file(fileURL, destfile="./data/housing.csv")
        
        housing<-read.table("./data/housing.csv", sep=",",header=TRUE)      
        
        mille<-housing[housing[,"ST"]==16,"VAL"]==24
        
        count <- 0
        for (i in 1:6496) {
                if (!is.na(mille[i])){
                        
                        if(mille[i]){
                                count =count+1
                        }
                }
        }
        count
        
}



