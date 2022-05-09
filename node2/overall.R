library(ggplot2)
library(ggrepel)
library(gridExtra)
library(grid)



args<-commandArgs(TRUE)

mydata <- read.csv(args[1])


p1 <- ggplot(mydata, aes(x = Time, y = Mem)) +
    geom_point(size=0.3) +
    #geom_text_repel(aes(label = Labels, colour=Annotations), size = 3, hjust=0.0) +
    geom_label_repel(aes(label = Labels, fill=Annotations), size=1.5, max.overlaps=Inf) +
    labs(title = "Process and Job usage", x = "Date", y = "% Memory") +
    theme(axis.text.x = element_text(angle = -90))

ggsave(args[2], p1, height = 7 , width = 15)
