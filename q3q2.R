## Quizz 3 question2

q3q2 <- function(){
        
        library(jpeg)

        URL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
        destfile=".\\data\\q3q2.jpg"
        if(!file.exists(destfile)){
                download.file(URL, destfile, mode = "wb")
        }
        img <- readJPEG(destfile, native=TRUE)
        
        q <-quantile(img,probs = c(0.3, 0.8))
        return(q)
}