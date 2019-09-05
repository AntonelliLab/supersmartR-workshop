# View phylogeny
#  Plot, rename tips, root....

# Library ----
library(ape)

# Vars ----
wd <- file.path(getwd(), 'pipelines', '1_multigene')
input_file <- file.path(wd, '5_phylogeny', 'RAxML_bestTree.supermatrix')

# Read in ----
tree <- read.tree(file = input_file)
plot(tree)
