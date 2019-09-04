# Align the sequences
# Use an alignment software to align the sequences contained within 2_clusters/

# Library ----
library(outsider)

# Vars ----
repo <- 'dombennett/om..mafft'
clade_gene <- 'aotus_cytb'
input_dir <- file.path('simple_pipeline', '2_clusters')
output_dir <- file.path('simple_pipeline', '3_align')
if (!dir.exists(output_dir)) {
  dir.create(output_dir)
}

# Install ----
if (!is_module_installed(repo)) {
  module_install(repo = repo, force = TRUE)
}
mafft <- module_import(fname = 'mafft', repo = repo)

# Align ----
# mafft(arglist = '--help')
input_file <- file.path(getwd(), input_dir, paste0(clade_gene, '.fasta'))
output_file <- file.path(getwd(), output_dir,
                         paste0(clade_gene, '_alignment.fasta'))
mafft(arglist = c('--auto', input_file, '>', output_file))
