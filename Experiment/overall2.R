library(ggplot2)
library(ggrepel)
library(gridExtra)
library(grid)


mydata <- read.csv('plot.csv')

#head(mydata)
#class(mydata$Labels)



#d <- data.frame(labels = mydata$Labels, full_texts = mydata$Annotations)



p1 <- ggplot(mydata, aes(x = Time, y = Mem)) +
    geom_point(size=0.3) +
    #geom_text_repel(aes(label = Labels, colour=factor(Annotations)), size = 3, hjust=0.0) +
    geom_label_repel(aes(label = Labels, fill=factor(Annotations)), size=1.5, max.overlaps=Inf) +
    labs(title = "Process and Job usage", x = "Date", y = "% Memory") +
    theme(axis.text.x = element_text(angle = -90))

ggsave("Rplots.pdf", p1, height = 7 , width = 15)

