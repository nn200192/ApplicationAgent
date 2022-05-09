library(ggdag) 
library(dagitty) 
library(ggplot2) 
theme_set(theme_dag()) 
dag_plot0<- dagify( 
20600 ~ 20596,
20603 ~ 20600,
labels = c("20596"="root started job 234: slurmstepd: [234.batch]","20600"="/bin/bash /var/spool/slurmd/job00234/slurm_script --oversubscribe","20603"="nwchem_openmpi siosi3.nw")) 
plot0 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag_plot0) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", show.legend = FALSE) + 
theme_dag() 
 
ggsave( "plot0.pdf",plot0)