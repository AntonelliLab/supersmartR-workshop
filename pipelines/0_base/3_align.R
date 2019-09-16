# Align the sequences
# Use an alignment software to align the sequences contained within 2_clusters/

# Library ----
library(outsider)

# Vars ----
repo <- 'dombennett/om..mafft'
wd <- file.path(getwd(), 'pipelines', '0_base')
input_dir <- file.path(wd, '2_clusters')
output_dir <- file.path(wd, '3_align')
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
input_file <- file.path(input_dir, 'selected.fasta')
output_file <- file.path(output_dir, 'alignment.fasta')
mafft(arglist = c('--auto', input_file, '>', output_file))
