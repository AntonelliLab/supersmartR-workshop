# Generate phylogeny
# Use an phylogeny generating software to make phylogeny from the alignments
# contained within 3_align/

# Library ----
library(outsider)

# Vars ----
repo <- 'dombennett/om..raxml'
wd <- file.path(getwd(), 'pipelines', '0_base')
input_dir <- file.path(wd, '3_align')
output_dir <- file.path(wd, '4_phylogeny')
if (!dir.exists(output_dir)) {
  dir.create(output_dir)
}

# Install ----
if (!is_module_installed(repo)) {
  module_install(repo = repo, force = TRUE)
}
raxml <- module_import(fname = 'raxml', repo = repo)

# Phylogeny ----
# raxml('-h')
input_file <- file.path(input_dir, 'alignment.fasta')
# fast analysis
seed_n <- round(runif(n = 1, min = 1, max = 99999))
raxml(arglist = c('-m', 'GTRGAMMA', '-s', input_file, '-p', seed_n, '-n',
                  'selected_cluster', '-T', '2'), outdir = output_dir)
