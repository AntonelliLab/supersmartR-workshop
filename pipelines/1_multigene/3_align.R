# Align the sequences
# Use an alignment software to align the sequences contained within 2_clusters/

# Library ----
library(outsider)

# Vars ----
repo <- 'dombennett/om..mafft'
wd <- file.path(getwd(), 'pipelines', '1_multigene')
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
input_files <- list.files(path = input_dir, pattern = '.fasta')
gene_clusters <- sub(pattern = '\\.fasta', replacement = '', x = input_files)
for (i in seq_along(input_files)) {
  cat('... aligning ', crayon::green(gene_clusters[[i]]), '\n')
  input_file <- file.path(input_dir, input_files[[i]])
  output_file <- file.path(output_dir, paste0(gene_clusters[[i]],
                                              '_alignment.fasta'))
  mafft(arglist = c('--auto', input_file, '>', output_file))
}
