library(ggdag) 
library(dagitty) 
library(ggplot2) 
theme_set(theme_dag()) 
dag <- dagify( 
labels = c("67296"="slurmstepd: [4468721.0]","67249"="slurmstepd: [4468721.batch]","53382"="slurmstepd: [4469419.batch]")) 
p0 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("09:01:01") + 
theme_dag() 
 

 
 
arrange0 <- ggarrange(p0, ncol =1, nrow = 1) 

myplots=list(arrange0) 
pdf( "plot09:01:01.pdf", height=7, width=15) 
myplots  
library(ggdag) 
library(dagitty) 
library(ggplot2) 
theme_set(theme_dag()) 
