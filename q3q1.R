## Quizz 3 question 1

q3q1 <- function(){
        
        library(data.table)
        
        URL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
        destfile=".\\data\\q3q1.csv"
        if(!file.exists(destfile)){
                download.file(URL, destfile)
        }
        DT<-fread(destfile, sep=",",header=TRUE)
        agricultureLogical <- DT[,ACR==3 & AGS==6]
        head(which(agricultureLogical))
        
}        