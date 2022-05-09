#  set theme of all DAGs to `theme_dag()`
library(ggdag)
library(dagitty)
library(ggplot2)
theme_set(theme_dag())

dag <- dagify( "dag {
     20728 -> 20724
     20731 -> 20728
     20762 -> 20758
     20763 -> 20762
     } ")

topologicalOrdering(dag)

ggdag(dag) +
  theme_dag()

#ggdag(dag, text = TRUE, node_size=6, text_size = 2, text_col="white", layout = "nicely")


