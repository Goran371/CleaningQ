## github app quizz week 2 Q1

githubapp <- function(){
        library(httr)
        library(httpuv)
        library(jsonlite)

## 1. Find OAuth settings for github:
##    http://developer.github.com/v3/oauth/
        oauth_endpoints("github")

## 2. Register an application at https://github.com/settings/applications
##    Insert your values below - if secret is omitted, it will look it up in
##    the GITHUB_CONSUMER_SECRET environmental variable.
##
##    Use http://localhost:1410 as the callback url

        Client_ID <- "7a48864352dbf559c993"
        GITHUB_CONSUMER_SECRET <- "e12439d3832f53bc39763da335809ab702d8e73b"
        githubapp1 <- oauth_app("github", Client_ID, GITHUB_CONSUMER_SECRET)

## 3. Get OAuth credentials
        github_token <- oauth2.0_token(oauth_endpoints("github"), githubapp1)

## 4. Use API
        req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
        stop_for_status(req)
        json1 <- content(req)

## 5. unpack JSON
##        tjson1 <- toJSON(json1)
##        cat(prettify(tjson1))
##        nchar(tjson1)
##        json2 <- fromJSON(tjson1)
##        class(json2)
##        dim(json2)

        json2 = jsonlite::fromJSON(toJSON(json1))
        print(json2[json2$name=="datasharing",45])

        a<-1
}
