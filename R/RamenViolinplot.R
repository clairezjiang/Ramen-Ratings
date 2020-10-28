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


#violin plot 
#Ratings given the type of style the ramen comes in

ramen$Stars<-as.numeric(as.character(ramen$Stars))

rate <- ramen[]

ggplot(ramen, 
       aes(x = Style, y = Stars, fill = Style)) +  geom_violin() + 
  scale_fill_manual(values=wes_palette(n=5, name="Darjeeling1")) 
