# Generate phylogeny
# Use supermatrix to make a phylogeny

# Library ----
library(outsider)

# Vars ----
repo <- 'dombennett/om..raxml'
wd <- file.path(getwd(), 'pipelines', '2_large')
input_dir <- file.path(wd, '4_supermatrix')
output_dir <- file.path(wd, '5_phylogeny')
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
supermatrix_file <- file.path(input_dir, 'supermatrix.fasta')
partition_file <- file.path(input_dir, 'partition.txt')
# fast analysis
seed_n <- round(runif(n = 1, min = 1, max = 99999))
raxml(arglist = c('-m', 'GTRGAMMA', '-s', supermatrix_file, '-p', seed_n, '-n',
                  'supermatrix', '-T', '2', '-q', partition_file),
      outdir = output_dir)
