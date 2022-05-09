#  set theme of all DAGs to `theme_dag()`
library(ggdag)
library(dagitty)
library(ggplot2)
theme_set(theme_dag())

dag <- dagify(20728 ~ 20724,
     20731 ~ 20728,
     20762 ~ 20758,
     20763 ~ 20762,
     labels = c("20728" = "Outcome", "20724" = "Treatment", 
               "20731" = "Confounder 1", "20763" = "Confounder 2", "20762"= "Treament3","20758"="Treatment2"))

PLOT1 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) +
         geom_dag_point(colour = 'DarkBlue', size=12) +
         geom_dag_edges(edge_width=0.3,edge_colour="black") +
         geom_dag_text(colour = 'white',size=3) +
         geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 2, col = "white", show.legend = FALSE) +
         theme_dag() 

PLOT1

#ggdag(dag, text = TRUE, node_size=6, text_size = 2, text_col="white", layout = "nicely")


