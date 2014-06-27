

## http://biostat.jhsph.edu/~jleek/contact.html 

## SQL on ACS

biostat1 <- function(){
        library (XML)
        con<-url("http://biostat.jhsph.edu/~jleek/contact.html")
        htmlCode <- readLines(con)
        close (con)
        print(nchar(htmlCode[10]))
        print(nchar(htmlCode[20]))
        print(nchar(htmlCode[30]))
        print(nchar(htmlCode[100]))
        
##        url <- "http://biostat.jhsph.edu/~jleek/contact.html"
##        html <-htmlTreeParse(URL, useInternalNodes=TRUE)
##        xpathSApply(html, "//", xmlValue)
}

