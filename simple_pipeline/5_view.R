# View phylogeny
#  Plot, rename tips, root....

# Library ----
library(ape)

# Vars ----
input_file <- file.path('simple_pipeline', '4_phylogeny',
                        'RAxML_bestTree.aotus_cytb')

# Read in ----
tree <- read.tree(file = input_file)
plot(tree)
