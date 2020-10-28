knitr::opts_chunk$set(echo = TRUE)
library(ggplot2)
library(tidyverse)
library(forcats)
library(conflicted)
library(dplyr)
library(tm)
library(googleVis)
library(wesanderson)
library(RColorBrewer)
ramen <- read_csv("C:\\Users\\DRAGON~1\\AppData\\Local\\Temp\\archive.zip")


#Where does most of the ramen in the world come from i.e. where is it produced?
#sort = TRUE allows df to be ordered from high to low
ramencountry <- ramen %>% count(Country, sort = TRUE)
head(ramencountry, n=10)

#ggplot graph
#data cleaning
ramenc2 <- data.frame(ramencountry)
names(ramenc2)[names(ramenc2)=="n"] <- "Count"
ramenc2$Count <- gsub("323", "324", ramenc2$Count)
ramenc2 <- ramenc2[-38,]
ramenc3 <- ramenc2[1:10,]
ramenc3$Count <- as.numeric(ramenc3$Count)
ramenc3$Country <- with(ramenc3, reorder(Country, -Count))
d <- ggplot(ramenc3, 
            aes(x= Country, y = Count, fill=ramenc3[1:10,]$Country)) 

d + geom_bar(stat= "identity") + 
  geom_text(aes(label = Count), vjust = -0.3, size = 3) +
  ggtitle("Top 10 Countries for Ramen" ) + 
  ylab("Count") +
  theme(axis.text.x = element_text(angle = 90), 
        plot.title =   element_text(hjust = 0.5)) + labs(fill="Country")

#prepare data and world map (interactive)
ramenc2$Country <- gsub("USA", "United States", ramenc2$Country)

#color
colorbrewer <- "{maxValue: 352, 
                colors:['#F7FCF0', '#E0F3DB', '#CCEBC5', '#A8DDB5',        '#7BCCC4', '#4EB3D3', '#2B8CBE', '#0868AC']}"

#World Map!
geo <- gvisGeoChart(ramenc2, 
                    locationvar = "Country",
                    colorvar = "Count", 
                    options = list(height=600, width=400, 
                                   colorAxis = colorbrewer))
#plot World Map
plot(geo)
