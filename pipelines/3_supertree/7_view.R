# View phylogeny
#  Plot, rename tips, root....

# Library ----
library(ape)

# Vars ----
outgroup_pattern <- '^castor_'
wd <- file.path(getwd(), 'pipelines', '3_supertree')
input_file <- file.path(wd, '6_supertree', 'supertree_2.tre')

# Read in ----
tree <- read.tree(file = input_file)
tree$edge.length <- NULL
# root tree
outgroup_tips <- tree$tip.label[grepl(pattern = outgroup_pattern,
                                      x = tree$tip.label, ignore.case = TRUE)]
tree <- root(unroot(tree), outgroup = outgroup_tips)
pdf(file = 'supertree.pdf', width = 7, height = 28)
plot(x = tree, no.margin = TRUE, cex = 0.75)
dev.off()
