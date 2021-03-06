## Claire Jiang 0ct 2020

#R File for Word Cloud

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



#show first 10 in data set "ramen"
head(ramen, n=10)



#make termdocumentmatrix with text mining package
#frequency of words in data set "ramen"
ramendoc <- Corpus(VectorSource(ramen$Variety))
ramentxt <- TermDocumentMatrix(ramendoc)
a <- as.matrix(ramentxt)
b <- sort(rowSums(a), decreasing = TRUE)
c <- data.frame(Word = names(b), freq = b)
head(c, 20)

#word cloud for the most frequent words 
set.seed(123)
wordcloud::wordcloud(words = c$Word, 
                     freq = c$freq, 
                     min.freq=1, 
                     max.words=100,  
                     random.order = FALSE, 
                     rot.per = 0.4, 
                     colors = c("darkseagreen3","violetred3",
                                "burlywood1", "royalblue1"))

#barplot for frequency of word
barplot(c[1:10,]$freq, 
        names.arg = c[1:10,]$Word, 
        col= "lightblue", 
        main = "Most Frequent Words in Variety Column", 
        ylab = "Word Frequencies", 
        las=2, cex.axis = 0.90)


