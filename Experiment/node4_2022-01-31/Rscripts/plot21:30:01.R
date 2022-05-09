library(ggpubr) 
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
ggtitle("21:30:01") + 
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
ggtitle("21:30:31") + 
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
ggtitle("21:31:01") + 
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
ggtitle("21:31:31") + 
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
ggtitle("21:32:01") + 
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
ggtitle("21:32:31") + 
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
ggtitle("21:33:01") + 
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
ggtitle("21:33:31") + 
theme_dag() 
 

 
 
dag <- dagify( 
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7546"="slurmstepd: [339.batch]","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p8 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("21:34:01") + 
theme_dag() 
 

 
 
dag <- dagify( 
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7546"="slurmstepd: [339.batch]","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p9 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("21:34:31") + 
theme_dag() 
 

 
 
dag <- dagify( 
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7546"="slurmstepd: [339.batch]","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p10 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("21:35:01") + 
theme_dag() 
 

 
 
dag <- dagify( 
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7546"="slurmstepd: [339.batch]","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p11 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("21:35:31") + 
theme_dag() 
 

 
 
dag <- dagify( 
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7546"="slurmstepd: [339.batch]","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p12 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("21:36:01") + 
theme_dag() 
 

 
 
dag <- dagify( 
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7546"="slurmstepd: [339.batch]","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p13 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("21:36:31") + 
theme_dag() 
 

 
 
dag <- dagify( 
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7546"="slurmstepd: [339.batch]","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p14 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("21:37:01") + 
theme_dag() 
 

 
 
dag <- dagify( 
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7546"="slurmstepd: [339.batch]","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p15 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("21:37:31") + 
theme_dag() 
 

 
 
dag <- dagify( 
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7546"="slurmstepd: [339.batch]","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p16 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("21:38:01") + 
theme_dag() 
 

 
 
dag <- dagify( 
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7546"="slurmstepd: [339.batch]","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p17 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("21:38:31") + 
theme_dag() 
 

 
 
dag <- dagify( 
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7546"="slurmstepd: [339.batch]","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p18 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("21:39:01") + 
theme_dag() 
 

 
 
dag <- dagify( 
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7546"="slurmstepd: [339.batch]","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p19 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("21:39:31") + 
theme_dag() 
 

 
 
arrange0 <- ggarrange(p0, p1, p2, ncol =3, nrow = 1) 
arrange1 <- ggarrange(p3, p4, p5, ncol =3, nrow = 1) 
arrange2 <- ggarrange(p6, p7, p8, ncol =3, nrow = 1) 
arrange3 <- ggarrange(p9, p10, p11, ncol =3, nrow = 1) 
arrange4 <- ggarrange(p12, p13, p14, ncol =3, nrow = 1) 
arrange5 <- ggarrange(p15, p16, p17, ncol =3, nrow = 1) 
arrange6 <- ggarrange(p18, p19, ncol =2, nrow = 1) 

myplots=list(arrange0, arrange1, arrange2, arrange3, arrange4, arrange5, arrange6) 
pdf( "/Users/nhinguyen/Downloads/Experiment/provenance_2022_01_31/graphs/plot21:30:01.pdf", height=7, width=15) 
myplots 
