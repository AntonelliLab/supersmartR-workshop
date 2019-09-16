# View phylogeny
#  Plot, rename tips, root....

# Library ----
library(ape)

# Vars ----
wd <- file.path(getwd(), 'pipelines', '0_base')
input_file <- file.path(wd, '4_phylogeny', 'RAxML_bestTree.selected_cluster')

# Read in ----
tree <- read.tree(file = input_file)
plot(tree, no.margin = TRUE)
