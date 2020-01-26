library(shiny)
library(datasets)
library(plotly)
library(revgeo)
library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)
library(plyr)
library(usmap)
library(mapproj)

shinyServer <- function(input, output) {
  
  datasetInput <- reactive({
    switch(input$distribution,
           "Twitter Data"=TwitterData)
  })
  output$Twitter <- renderPlotly({
    heatmap<-read.csv(file="C:/Semester1/DIC Lab/Lab1/Part3/Data.csv")
    #heatmap
    # length(heatmap)
    # view(heatmap)
    heatmapsub<-subset(heatmap , select=c("State","ACTIVITY.LEVEL","Activity.Label"))
    #colnames(heatmap)
    heatmap$State<-tolower(heatmap$State)
    states <- map_data("state")
    hm1<-heatmap
    hm1$State<-tolower(hm1$State)
    heatmapsub$region<-tolower(heatmapsub$State)
    map.df<-merge(states,heatmapsub,by='region',all.heatmapsub=T)
    map.df <- map.df[order(map.df$order),]
    heatmap$ACTIVITY.LEVEL<-substr(heatmap$ACTIVITY.LEVEL,6,9)
    map.df$ACTIVITY.LEVEL<-substr(map.df$ACTIVITY.LEVEL,6,9)
    options(repr.plot.width=16, repr.plot.height=8)
    ggplot(map.df, aes(x=long,y=lat,group=group))+
      geom_polygon(aes(fill=as.character(as.numeric(ACTIVITY.LEVEL)+81)))+
      geom_path()+
      scale_fill_manual(labels=c('Minimal','Very Low','Low','Moderate1','Moderate2','Moderate3','High1','High2','High3'),
                        values=c("darkolivegreen1","lightgreen","green","yellow","gold","orange","darkgoldenrod","darkred","red"))+
      ggtitle("Twitter Data for the Keywork - Flu")+
      theme(plot.title = element_text(size = 20, face = "bold"))
    
  })
  
  
  output$Text<-renderText({
    "Collected the tweets using twitteR Package. Collected total 80,000 tweets over a span of 3 days using key words flu, in which I filtered tweets of US to around 1800 and represented the tweets frequency as per each state in the graph"
  })

   output$Comparision <- renderPlotly({
     hmap<-read.csv(file="C:/Semester1/DIC Lab/Lab1/Part2/StateDataforMap_2018-19week5.csv")
     hmapsub<-subset(hmap , select=c("STATENAME","ACTIVITY.LEVEL","ACTIVITY.LEVEL.LABEL"))
     colnames(hmap)
     hmap$STATENAME<-tolower(hmap$STATENAME)
     states1 <- map_data("state")
     hm1<-hmap
     hm1$STATENAME<-tolower(hm1$STATENAME)
     hmapsub$region<-tolower(hmapsub$STATENAME)
     map.df<-merge(states1,hmapsub,by='region',all.hmapsub=T)
     map.df <- map.df[order(map.df$order),]
     hmap$ACTIVITY.LEVEL<-substr(hmap$ACTIVITY.LEVEL,6,9)
     map.df$ACTIVITY.LEVEL<-substr(map.df$ACTIVITY.LEVEL,6,9)
     options(repr.plot.width=16, repr.plot.height=8)
     ggplot(map.df, aes(x=long,y=lat,group=group))+
       geom_polygon(aes(fill=as.character(as.numeric(ACTIVITY.LEVEL)+81)))+
       geom_path()+
       scale_fill_manual(labels=c('Minimal','Very Low','Low','Moderate1','Moderate2','Moderate3','High1','High2','High3'),
                         values=c("darkolivegreen1","lightgreen","green","yellow","gold","orange","darkgoldenrod","darkred","red"))+
       ggtitle("Twitter Data for the Keyword - Flu")+
       theme(plot.title = element_text(size = 20, face = "bold"))
   })
}