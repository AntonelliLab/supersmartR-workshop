# Generate phylogeny
# Use an phylogeny generatubg software to make phylogeny from the alignments contained within 3_align/

# Library ----
library(outsider)

# Vars ----
clade_gene <- 'aotus_cytb'
repo <- 'dombennett/om..raxml'
input_dir <- file.path('simple_pipeline', '3_align')
output_dir <- file.path('simple_pipeline', '4_phylogeny')
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
input_file <- file.path(getwd(), input_dir,
                        paste0(clade_gene, '_alignment.fasta'))
# fast analysis
seed_n <- round(runif(n = 1, min = 1, max = 99999))
# TODO: create arglist
raxml('-m', 'GTRGAMMA', '-s', input_file, '-p', seed_n, '-n', clade_gene, '-T',
      '2')
# secondary movement of files to output_dir
fls <- list.files(pattern = clade_gene)
for (fl in fls) {
  file.copy(from = fl, to = file.path(output_dir, fl))
  file.remove(fl)
}
