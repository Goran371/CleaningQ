idaho2 <-function(loop) {
        
        URL5<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
        destfile=".\\data\\houses.csv"
        if(!file.exists(destfile)){
                download.file(URL5, destfile)
        }
        
        DT<-fread(destfile, sep=",",header=TRUE)
        
        time1<-system.time({
                for(i in 1:loop) {
                        mean1 <-tapply(DT$pwgtp15,DT$SEX,mean)
                }
        })
        print(time1)
        print(mean1)
        
        time2<-system.time({
                for(i in 1:loop) {
                        mean2 <-sapply(split(DT$pwgtp15,DT$SEX),mean)
                }
        })  
        print(time2)
        print(mean2)
        
        time4<-system.time({
                for(i in 1:loop) {
                        mean4 <-mean(DT$pwgtp15,by=DT$SEX)
                }
        })
        print(time4)
        print(mean4)
        
        time5<-system.time({
                for(i in 1:loop) {
                        mean5 <-mean<-mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)   
                }
        })
        print(time5)
        print(mean5)
        
        time6<-system.time({
                for(i in 1:loop) {  
                        mean6<-DT[,mean(pwgtp15),by=SEX]
                }
        })
        print(time6)
        print(mean6)
        
        
        a<-0
}