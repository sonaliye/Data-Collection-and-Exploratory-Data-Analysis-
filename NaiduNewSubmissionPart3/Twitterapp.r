# install.packages('twitteR')
install.packages("ggmap")
install.packages("maptools")
install.packages("ROAuth")
install.packages("devtools")
install.packages("ggplot2")
install.packages(c("maps", "mapdata"))
install_github("dkahle/ggmap")
install.packages("dkahle/ggmap")
install.packages("dkahle/ggmap")
install.packages("base64enc")
install_github("dkahle/ggmap", ref = "tidyup")
library(maps)
library(devtools)
library(ggmap)
library(twitteR)
library(RCurl)
library(ROAuth)
library(maptools)
library(ggplot2)
library(httpuv)
library(openssl)
library(ggmap)
library(base64enc)

# options(httr_oauth_cache=T)
api_key<-"ohvwkojCg5BSBnHXefyvHUJh7"
api__secret<-"PHny3AoCiQb2MeSqSDNfq5Cha52mkVyhjPsrnrL507xucJIL6b"
access_token<-"1094424866944630785-dydQmSIhVrqrmEGux8EMOyoaP01XJs"
access_token_secret<-"Hgk5RQrCsjRVRReJwTsehd0ATt02VocOTUmboMjcwvRW6"

# create_token(
#   app = "Sonali Lab1",
#   consumer_key = "ohvwkojCg5BSBnHXefyvHUJh7",
#   consumer_secret = "PHny3AoCiQb2MeSqSDNfq5Cha52mkVyhjPsrnrL507xucJIL6b",
#   access_token = "9551451262-wK2EmA942kxZYIwa5LMKZoQA4Xc2uyIiEwu2YXL",
#   access_secret = "9vpiSGKg1fIPQtxc5d5ESiFlZQpfbknEN1f1m2xe5byw7")

setup_twitter_oauth(api_key,api__secret,access_token,access_token_secret)
register_google(key = 'ohvwkojCg5BSBnHXefyvHUJh7')

result<-searchTwitter("flu",n=50)
length(result)
dataframe.df <- twListToDF(result)

View(dataframe.df)

usernames <- dataframe.df$screenName

users.df <- twListToDF(lookupUsers(usernames))

View(users.df)

Location <- users.df$location[(users.df$location != "")]

View(Location)

FilteredTweets <- Location[grepl('Alabama|Alaska|Arizona|Arkansas|California|Colorado|Connecticut|
                                 Delaware|Florida|Georgia|Hawaii|Idaho|Illinois|Indiana|Iowa|Kansas|Kentucky|Louisiana|Maine|Maryland|Massachusetts|Michigan|Minnesota|Mississippi|Missouri|Montana|Nebraska|Nevada|New Hampshire|New Jersey|New Mexico|New York|North Carolina|North Dakota|Ohio|Oklahoma|Oregon|Pennsylvania Rhode Island|South Carolina|South Dakota|Tennessee|Texas|Utah|Vermont|Virginia|Washington|West Virginia|Wisconsin|Wyoming', Location, ignore.case = TRUE)]

write.csv(FilteredTweets,"Data10.csv")