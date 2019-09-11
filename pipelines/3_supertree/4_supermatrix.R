# Construct a supermatrix
# Generate a .fasta file of all the alignments

# Library ----
library(gaius)

# Vars ----
wd <- file.path(getwd(), 'pipelines', '3_supertree')
input_dir <- file.path(wd, '3_align')
output_dir <- file.path(wd, '4_supermatrix')
if (!dir.exists(output_dir)) {
  dir.create(output_dir)
}
tree_file <- file.path(wd, '6_supertree', 'supertree.tre')

# Identify groups ----
# set parameters with pset()/pget()
# min_ntips - the minimum number of tips per group, default 5
# max_ntips - the maximum number of tips per group, default 100
alignment_files <- file.path(input_dir, list.files(path = input_dir,
                                                   pattern = '.fasta'))
alignment_names <- names_from_alignments(alignment_files)
tree_names <- names_from_tree(tree_file)
matched_names <- name_match(alignment_names = alignment_names,
                            tree_names = tree_names)
groups <- groups_get(tree_file = tree_file, matched_names = matched_names)

# Supermatrices ----
# min_ngenes - minimum number of genes in matrix
# min_ntips - minimum number of tips in matrix
# min_nbps - minimum number of base paris in a gene
# column_cutoff - proportion of non-gaps per column
# tip_cutoff - proportion of non-gaps per tip
alignment_list <- alignment_read(flpths = alignment_files)
supermatrices <- supermatrices_get(alignment_list = alignment_list,
                                   groups = groups, min_ngenes = 2,
                                   min_ntips = 5, min_nbps = 250,
                                   column_cutoff = 0.1, tip_cutoff = 0.1)
# check all mono. groups in backbone
nmono <- sum(names(groups) %in% names(supermatrices[['backbone']]))
if (nmono != (length(groups) - 1)) {
  stop('Too few mono. groups in backbone')
}

# Write out ----
ids <- names(supermatrices)
for (id in ids) {
  supermatrix <- supermatrices[[id]]
  # number of bps per cluster
  nbps <- attr(supermatrix, 'nbps')
  flnm <- paste0(id, "_partition.txt")
  partition_file(nbp = nbps, flpth = file.path(output_dir, flnm))
  flnm <- paste0(id, '_supermatrix.fasta')
  sequences_write(x = supermatrix, flpth = file.path(output_dir, flnm))
}
