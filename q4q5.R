## You can use the quantmod (http://www.quantmod.com/) package to get historical stock prices
## for publicly traded companies on the NASDAQ and NYSE. Use the following code to download
## data on Amazon's stock price and get the times the data was sampled.
## library(quantmod)
## amzn = getSymbols("AMZN",auto.assign=FALSE)
## sampleTimes = index(amzn) 

q4q5 <- function(){
        library(quantmod)
        amzn = getSymbols("AMZN",auto.assign=FALSE)
        sampleTimes = index(amzn)
        
        d<-index(amzn)
        
        obs2012 <- grep("2012",d)
        print(length(obs2012))
        mondays <- 0
        for(i in 1:length(obs2012)) {
                if (weekdays(d[obs2012[i]])=="Monday") mondays <- mondays +1
        }
        print(mondays)
        format(d[1261], "%a %b %d %Y")
        
        
}