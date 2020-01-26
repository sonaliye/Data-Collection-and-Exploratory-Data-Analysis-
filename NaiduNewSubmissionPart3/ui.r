# install.packages("shiny")
# install.packages('twitteR')
# install.packages("ggmap")
# install.packages("maptools")
# install.packages("ROAuth")
# install.packages("devtools")
# install.packages("ggplot2")
# install.packages(c("maps", "mapdata"))
# install_github("dkahle/ggmap")
# install.packages("dkahle/ggmap")
# install.packages("dkahle/ggmap")
# install.packages("base64enc")
# install_github("dkahle/ggmap", ref = "tidyup")
# install.packages("plotly")
# install.packages("mapproj")
#install.packages("usmap")
#install.packages("plyr")
#install.packages("revgeo")
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
library(shiny)
library(plotly)
library(mapproj)
shinyUI(
  pageWithSidebar(
    headerPanel("Twitter Application"),
    
    sidebarPanel(
      selectInput("Distribution", "Please select the Graph",
                  choices=c('Twitter Data'))
    ),
    
    mainPanel(
      #tableOutput("contents")
      plotlyOutput("Twitter"),
      textOutput("Text"),
      plotlyOutput("Comparision")
      
      
    )
  )
)