q3q3 <- function(){
        
        library(data.table)
        library(Hmisc)
        
        URL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
        GDPfile=".\\data\\q3q3-GDP.csv"
        if(!file.exists(GDPfile)){
                download.file(URL, GDPfile)
        }
        GDP<-read.csv(GDPfile, header=FALSE, sep=",", stringsAsFactors = FALSE, skip = 5)
##      GDP frame has no header, col1=country abbr, 2=rank, 4=full name, 5=GDP
##      data until line 190 is related to GDP ranking and will be used to create GDPrank
##      data from line 219 to 231 have useful data for GDP by regions abd will be used for GDPreg
        range <-1:190
        GDPrank <- data.frame(abbrev=GDP[range,1], rank=as.numeric(GDP[range,2]), name=GDP[range,4], gdp=as.numeric(gsub(",","",GDP[range,5])))
        
        range1 <-219:231
        GDPreg <- data.frame(abbrev=GDP[range1,1],name=GDP[range1,4], avera=as.numeric(gsub(",","",GDP[range1,5])))

        URL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
        EDUfile=".\\data\\q3q3-EDU.csv"
        if(!file.exists(EDUfile)){
                download.file(URL, EDUfile)
        }
        EDU<-read.csv(EDUfile, header=TRUE, sep=",")
## match country codes in GDPrank and EDU and find out how many are matching excluding NA
        matchingCodeVector <- match(GDPrank[,1],EDU[,1])
        noNAVector <- matchingCodeVector[!is.na(matchingCodeVector)]
        matches <- length(noNAVector)
        print("number of matches")
        print(matches)

## sort GDPrank in decreasing  order
        GDPsortedRev <- GDPrank[order(GDPrank$rank, decreasing=TRUE),]
        print("number 13 in sorted frame")
        print(GDPsortedRev[13,3])

## Q3Q4 EDU col 3 has income groups like High income: OECD and High income: nonOECD
## create two vectors with country abbreviations for each of the two income groups
## match with GDPrank to find the corresponding ranking, remove NAs, avarage ranks
## matchOECD line wrong
        HighIncOECD <- as.character(EDU[as.character(EDU[,3])== "High income: OECD",1])
        tot=0
        for(i in 1:length(HighIncOECD)){
             tot<-tot + GDPrank[GDPrank$abbrev==HighIncOECD[i],2]
        }
        HighIncOECDAverRank<-tot/length(HighIncOECD)
        print("High Income OECD avarage ranking")
        print(HighIncOECDAverRank)

        HighIncNonOECD <- as.character(EDU[as.character(EDU[,3])== "High income: nonOECD",1])
        tot=0
        len=0
        for(i in 1:length(HighIncNonOECD)){
                if(!is.na(match(HighIncNonOECD[i], GDPrank[,1]))){
                        tot<-tot + GDPrank[GDPrank$abbrev==HighIncNonOECD[i],2] 
                        len <-len+1
                }
                
        }
        HighIncNonOECDAverRank<-tot/len
        print("High Income nonOECD avarage ranking")
        print(HighIncNonOECDAverRank)


## Q3Q5 find the 5 quantiles and tthe lower bound GDP of ther top 20%
        rankDataGroups <-cut2(GDPrank[,4],g=5)
        GDPtable <-table(rankDataGroups)
        topQuantileStr <- attr(GDPtable[5],"names")
        rangeSplit <-strsplit(topQuantileStr, ",")
        rangeSplit1 <-strsplit(rangeSplit[[1]][1],"\\[")
        lowerBound <-as.numeric(rangeSplit1[[1]][2])
## proceed to figure out a vector of contry abbrev above the lowerBound (in GDPrank)
        top20 <- GDPrank[GDPrank[4]>=lowerBound,1]
        LMI <- EDU[EDU$Income.Group=="Lower middle income",1]
## compare that with lower middle income group from EDU
        topLMI <- match(top20,LMI)
        noNA <- na.omit(topLMI)
        topGDPLMI <-length(noNA)
        print("# of counties in top20% GDP and still lower middle income")
        print(topGDPLMI)
        print (LMI[noNA[1:topGDPLMI]])
## there is probably a more direct way to find thelist of country abbrev directly from the cut2?

        
        return(0)
}        