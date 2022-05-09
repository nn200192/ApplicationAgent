#library(ggpubr) 
library(ggdag) 
library(dagitty) 
library(ggplot2) 
theme_set(theme_dag()) 
dag <- dagify( 
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7546"="slurmstepd: [339.batch]","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p0 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("22:00:01") + 
theme_dag() 
 

 
 
dag <- dagify( 
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7546"="slurmstepd: [339.batch]","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p1 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("22:00:31") + 
theme_dag() 
 

 
 
dag <- dagify( 
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7546"="slurmstepd: [339.batch]","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p2 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("22:01:01") + 
theme_dag() 
 

 
 
dag <- dagify( 
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7546"="slurmstepd: [339.batch]","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p3 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("22:01:31") + 
theme_dag() 
 

 
 
dag <- dagify( 
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7546"="slurmstepd: [339.batch]","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p4 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("22:02:01") + 
theme_dag() 
 

 
 
dag <- dagify( 
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7546"="slurmstepd: [339.batch]","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p5 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("22:02:31") + 
theme_dag() 
 

 
 
dag <- dagify( 
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7546"="slurmstepd: [339.batch]","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p6 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("22:03:01") + 
theme_dag() 
 

 
 
dag <- dagify( 
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7546"="slurmstepd: [339.batch]","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p7 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("22:03:31") + 
theme_dag() 
 

 
 
arrange0 <- ggarrange(p0, p1, p2, ncol =3, nrow = 1) 
arrange1 <- ggarrange(p3, p4, p5, ncol =3, nrow = 1) 
arrange2 <- ggarrange(p6, p7, ncol =2, nrow = 1) 

myplots=list(arrange0, arrange1, arrange2) 
pdf( "/Users/nhinguyen/Downloads/Experiment/provenance_2022_01_31/graphs/plot22:00:01.pdf", height=7, width=15) 
myplots 
