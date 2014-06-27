## SQL on American Community Survey data

acsFile <- function(){
        library (sqldf)
        library(data.table)
        
        URL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv "
        destfile=".\\data\\acs.csv"
        if(!file.exists(destfile)){
                download.file(URL, destfile)
        }
        acs<-fread(destfile, sep=",",header=TRUE)
        query1 <- sqldf("select * from acs")
        print(query1)
        query2 <- sqldf("select * from acs where AGEP < 50 and pwgtp1")
        print(query2)
        query3 <- sqldf("select pwgtp1 from acs where AGEP < 50")
        print(query3)
        query4 <- sqldf("select * from acs where AGEP < 50")
        print(query4)
        
        uni <- unique(acs$AGEP)
        print(uni)
        query5 <- sqldf("select unique AGEP from acs")
        print(query5)
        if (identical(uni,query5)) print("first is identical")
        query6 <- sqldf("select distinct AGEP from acs")
        print(query6)
        if (identical(uni,query6)) print("second is identical")
        query7 <- sqldf("select AGEP where unique from acs")
        print(query7)
        if (identical(uni,query7)) print("third is identical")
        query8 <- sqldf("select distinct pwgtp1 from acs")
        print(query8)
        if (identical(uni,query8)) print("fourth is identical")
        

        
}