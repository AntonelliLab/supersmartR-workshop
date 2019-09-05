# Construct a supermatrix
# Generate a .fasta file of all the alignments

# Library ----
library(gaius)

# Vars ----
wd <- file.path(getwd(), 'pipelines', '1_multigene')
input_dir <- file.path(wd, '3_align')
output_dir <- file.path(wd, '4_supermatrix')
if (!dir.exists(output_dir)) {
  dir.create(output_dir)
}

# Input ---
alignment_files <- file.path(input_dir, list.files(path = input_dir,
                                                   pattern = '.fasta'))
alignment_list <- alignment_read(flpths = alignment_files)

# Supermatrix ----
# min_ngenes - minimum number of genes in matrix
# min_ntips - minimum number of tips in matrix
# min_nbps - minimum number of base paris in a gene
# column_cutoff - proportion of non-gaps per column
# tip_cutoff - proportion of non-gaps per tip
supermatrix <- supermatrices_get(alignment_list = alignment_list,
                                 min_ngenes = 2, min_ntips = 5, min_nbps = 250,
                                 column_cutoff = 0.5, tip_cutoff = 0.5)
supermatrix <- supermatrix[[1]]
# number of bps per cluster
nbps <- attr(supermatrix, 'nbps')

# Write out ----
partition_file(nbp = nbps, flpth = file.path(output_dir, "partition.txt"))
sequences_write(x = supermatrix, flpth = file.path(output_dir,
                                                   'supermatrix.fasta'))
