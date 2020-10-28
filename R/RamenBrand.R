#what is the most common ramen brand?
ramenbrand <- ramen %>% count(Brand, sort = TRUE)
head(ramenbrand, n = 10)

names(ramenbrand)[names(ramenbrand)=="n"] <- "Count"
ramenbrand$Count <- as.numeric(ramenbrand$Count)
ramenbrand$Brand <- with(ramenbrand, reorder(Brand, Count))

p <- ggplot(ramenbrand[1:8,], 
            aes(x = Brand, y = Count, fill = Brand))

p + geom_bar(stat = "identity") +
  geom_text(aes(label = Count), vjust = -0.3, size = 2) +
  ggtitle("Most Common Brand Names") +
  ylab("Count") + 
  theme(axis.text.x = element_text(angle = 90), 
        plot.title =   element_text(hjust = 0.5))+
  scale_fill_brewer(palette = "Greens")