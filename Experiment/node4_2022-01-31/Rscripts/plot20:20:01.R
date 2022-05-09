library(ggpubr) 
library(ggdag) 
library(dagitty) 
library(ggplot2) 
theme_set(theme_dag()) 
dag <- dagify( 
7393 ~ 7389,
7394 ~ 7393,
labels = c("7389"="slurmstepd: [324.batch]","7393"="/bin/bash /var/spool/slurmd/job00324/slurm_script --oversubscribe","7394"="python3 videoProcessing.py")) 
p0 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("20:21:01") + 
theme_dag() 
 

 
 
dag <- dagify( 
7445 ~ 7441,
7448 ~ 7445,
7457 ~ 7453,
7460 ~ 7457,
7462 ~ 7460,
labels = c("7441"="slurmstepd: [329.batch]","7453"="slurmstepd: [330.batch]","7445"="/bin/bash /var/spool/slurmd/job00329/slurm_script --oversubscribe","7457"="/bin/bash /var/spool/slurmd/job00330/slurm_script --oversubscribe","7448"="nwchem_openmpi density_diamond.nw","7460"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -var r 1000 -in in.rhodo -sf omp","7462"="lmp -var r 1000 -in in.rhodo -sf omp")) 
p1 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("20:21:31") + 
theme_dag() 
 

 
 
dag <- dagify( 
7445 ~ 7441,
7448 ~ 7445,
7457 ~ 7453,
7460 ~ 7457,
7462 ~ 7460,
labels = c("7441"="slurmstepd: [329.batch]","7453"="slurmstepd: [330.batch]","7445"="/bin/bash /var/spool/slurmd/job00329/slurm_script --oversubscribe","7457"="/bin/bash /var/spool/slurmd/job00330/slurm_script --oversubscribe","7448"="nwchem_openmpi density_diamond.nw","7460"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -var r 1000 -in in.rhodo -sf omp","7462"="lmp -var r 1000 -in in.rhodo -sf omp")) 
p2 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("20:22:01") + 
theme_dag() 
 

 
 
dag <- dagify( 
7445 ~ 7441,
7448 ~ 7445,
7498 ~ 7494,
7499 ~ 7498,
labels = c("7441"="slurmstepd: [329.batch]","7494"="slurmstepd: [334.batch]","7445"="/bin/bash /var/spool/slurmd/job00329/slurm_script --oversubscribe","7498"="/bin/bash /var/spool/slurmd/job00334/slurm_script --oversubscribe","7448"="nwchem_openmpi density_diamond.nw","7499"="python3 sleep_test.py")) 
p3 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("20:22:31") + 
theme_dag() 
 

 
 
dag <- dagify( 
7498 ~ 7494,
7499 ~ 7498,
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7494"="slurmstepd: [334.batch]","7546"="slurmstepd: [339.batch]","7498"="/bin/bash /var/spool/slurmd/job00334/slurm_script --oversubscribe","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7499"="python3 sleep_test.py","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p4 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("20:23:01") + 
theme_dag() 
 

 
 
dag <- dagify( 
7498 ~ 7494,
7499 ~ 7498,
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7494"="slurmstepd: [334.batch]","7546"="slurmstepd: [339.batch]","7498"="/bin/bash /var/spool/slurmd/job00334/slurm_script --oversubscribe","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7499"="python3 sleep_test.py","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p5 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("20:23:31") + 
theme_dag() 
 

 
 
dag <- dagify( 
7498 ~ 7494,
7499 ~ 7498,
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7494"="slurmstepd: [334.batch]","7546"="slurmstepd: [339.batch]","7498"="/bin/bash /var/spool/slurmd/job00334/slurm_script --oversubscribe","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7499"="python3 sleep_test.py","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p6 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("20:24:01") + 
theme_dag() 
 

 
 
dag <- dagify( 
7498 ~ 7494,
7499 ~ 7498,
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7494"="slurmstepd: [334.batch]","7546"="slurmstepd: [339.batch]","7498"="/bin/bash /var/spool/slurmd/job00334/slurm_script --oversubscribe","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7499"="python3 sleep_test.py","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p7 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("20:24:31") + 
theme_dag() 
 

 
 
dag <- dagify( 
7498 ~ 7494,
7499 ~ 7498,
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7494"="slurmstepd: [334.batch]","7546"="slurmstepd: [339.batch]","7498"="/bin/bash /var/spool/slurmd/job00334/slurm_script --oversubscribe","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7499"="python3 sleep_test.py","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p8 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("20:25:01") + 
theme_dag() 
 

 
 
dag <- dagify( 
7498 ~ 7494,
7499 ~ 7498,
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7494"="slurmstepd: [334.batch]","7546"="slurmstepd: [339.batch]","7498"="/bin/bash /var/spool/slurmd/job00334/slurm_script --oversubscribe","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7499"="python3 sleep_test.py","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p9 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("20:25:31") + 
theme_dag() 
 

 
 
dag <- dagify( 
7498 ~ 7494,
7499 ~ 7498,
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7494"="slurmstepd: [334.batch]","7546"="slurmstepd: [339.batch]","7498"="/bin/bash /var/spool/slurmd/job00334/slurm_script --oversubscribe","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7499"="python3 sleep_test.py","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p10 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("20:26:01") + 
theme_dag() 
 

 
 
dag <- dagify( 
7498 ~ 7494,
7499 ~ 7498,
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7494"="slurmstepd: [334.batch]","7546"="slurmstepd: [339.batch]","7498"="/bin/bash /var/spool/slurmd/job00334/slurm_script --oversubscribe","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7499"="python3 sleep_test.py","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p11 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("20:26:31") + 
theme_dag() 
 

 
 
dag <- dagify( 
7498 ~ 7494,
7499 ~ 7498,
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
labels = c("7494"="slurmstepd: [334.batch]","7546"="slurmstepd: [339.batch]","7498"="/bin/bash /var/spool/slurmd/job00334/slurm_script --oversubscribe","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7499"="python3 sleep_test.py","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7555"="lmp -in in.free_sampling")) 
p12 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("20:27:01") + 
theme_dag() 
 

 
 
dag <- dagify( 
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
7679 ~ 7675,
7692 ~ 7679,
labels = c("7546"="slurmstepd: [339.batch]","7675"="slurmstepd: [344.batch]","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7679"="/bin/bash /var/spool/slurmd/job00344/slurm_script --oversubscribe","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7692"="java CopyContent","7555"="lmp -in in.free_sampling")) 
p13 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("20:27:31") + 
theme_dag() 
 

 
 
dag <- dagify( 
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
7679 ~ 7675,
7692 ~ 7679,
labels = c("7546"="slurmstepd: [339.batch]","7675"="slurmstepd: [344.batch]","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7679"="/bin/bash /var/spool/slurmd/job00344/slurm_script --oversubscribe","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7692"="java CopyContent","7555"="lmp -in in.free_sampling")) 
p14 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("20:28:01") + 
theme_dag() 
 

 
 
dag <- dagify( 
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
7679 ~ 7675,
7692 ~ 7679,
labels = c("7546"="slurmstepd: [339.batch]","7675"="slurmstepd: [344.batch]","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7679"="/bin/bash /var/spool/slurmd/job00344/slurm_script --oversubscribe","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7692"="java CopyContent","7555"="lmp -in in.free_sampling")) 
p15 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("20:28:31") + 
theme_dag() 
 

 
 
dag <- dagify( 
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
7737 ~ 7733,
7738 ~ 7737,
labels = c("7546"="slurmstepd: [339.batch]","7733"="slurmstepd: [348.batch]","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7737"="/bin/bash /var/spool/slurmd/job00348/slurm_script --oversubscribe","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7738"="/usr/lib64/R/bin/exec/R --slave --no-restore --file=example.R","7555"="lmp -in in.free_sampling")) 
p16 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("20:29:01") + 
theme_dag() 
 

 
 
dag <- dagify( 
7550 ~ 7546,
7553 ~ 7550,
7555 ~ 7553,
7737 ~ 7733,
7738 ~ 7737,
labels = c("7546"="slurmstepd: [339.batch]","7733"="slurmstepd: [348.batch]","7550"="/bin/bash /var/spool/slurmd/job00339/slurm_script --oversubscribe","7737"="/bin/bash /var/spool/slurmd/job00348/slurm_script --oversubscribe","7553"="mpirun --allow-run-as-root --mca btl self,vader --map-by l3cache lmp -in in.free_sampling","7738"="/usr/lib64/R/bin/exec/R --slave --no-restore --file=example.R","7555"="lmp -in in.free_sampling")) 
p17 <- ggplot(ggplot2::aes(x = x, y = y, xend = xend, yend = yend), data = dag) + 
geom_dag_point(colour = "DarkBlue", size=14) + 
geom_dag_edges(edge_width=0.3,edge_colour="black") + 
geom_dag_text(colour = "white",size=4) + 
geom_dag_label_repel(aes(label = label, size=0.3, fill = label), size = 3, direction = c("y"), col = "white", force=3, show.legend = FALSE) + 
ggtitle("20:29:31") + 
theme_dag() 
 

 
 
arrange0 <- ggarrange(p0, p1, p2, ncol =3, nrow = 1) 
arrange1 <- ggarrange(p3, p4, p5, ncol =3, nrow = 1) 
arrange2 <- ggarrange(p6, p7, p8, ncol =3, nrow = 1) 
arrange3 <- ggarrange(p9, p10, p11, ncol =3, nrow = 1) 
arrange4 <- ggarrange(p12, p13, p14, ncol =3, nrow = 1) 
arrange5 <- ggarrange(p15, p16, p17, ncol =3, nrow = 1) 

myplots=list(arrange0, arrange1, arrange2, arrange3, arrange4, arrange5) 
pdf( "/Users/nhinguyen/Downloads/Experiment/provenance_2022_01_31/graphs/plot20:20:01.pdf", height=7, width=15) 
myplots 
