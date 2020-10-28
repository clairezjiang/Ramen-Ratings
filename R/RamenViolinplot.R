#violin plot 
#Ratings given the type of style the ramen comes in

ramen$Stars<-as.numeric(as.character(ramen$Stars))

rate <- ramen[]

ggplot(ramen, 
       aes(x = Style, y = Stars, fill = Style)) +  geom_violin() + 
  scale_fill_manual(values=wes_palette(n=5, name="Darjeeling1")) 