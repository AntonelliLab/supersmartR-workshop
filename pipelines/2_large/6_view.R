# View phylogeny
#  Plot, rename tips, root....

# Library ----
library(ape)

# Vars ----
outgroup_pattern <- 'castor'
wd <- file.path(getwd(), 'pipelines', '2_large')
input_file <- file.path(wd, '5_phylogeny', 'RAxML_bestTree.supermatrix')

# Read in ----
tree <- read.tree(file = input_file)
# root tree
outgroup_tips <- tree$tip.label[grepl(pattern = outgroup_pattern,
                                      x = tree$tip.label, ignore.case = TRUE)]
tree <- root(unroot(tree), outgroup = outgroup_tips)
plot(x = tree, no.margin = TRUE)
