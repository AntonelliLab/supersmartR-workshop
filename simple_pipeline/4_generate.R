# Generate phylogeny
# Use an phylogeny generatubg software to make phylogeny from the alignments contained within 3_align/

# Library ----
library(outsider)

# Vars ----
print('vars')
repo <- 'dombennett/om..raxml'
input_dir <- file.path('simple_pipeline', '3_align')
output_dir <- file.path('simple_pipeline', '4_phylogeny')
if (!dir.exists(output_dir)) {
  dir.create(output_dir)
}

# Install ----
print('import')
if (!is_module_installed(repo)) {
  module_install(repo = repo, force = TRUE)
}
raxml <- module_import(fname = 'raxml', repo = repo)

# Phylogeny ----
# raxml('-h')
print('phy')
output_file_pattern <- 'aotus_cytb'
print(input_dir)
input_file <- file.path(getwd(), input_dir, 'aotus_cytb_alignment.fasta')
print(input_file)
# fast analysis
print('phy')
seed_n <- round(runif(n = 1, min = 1, max = 99999))
print('phy')
# TODO: create arglist
raxml('-m', 'GTRGAMMA', '-s', input_file, '-p', seed_n, '-n',
      output_file_pattern, '-T', '2')
# secondary movement of files to output_dir
fls <- list.files(pattern = output_file_pattern)
for (fl in fls) {
  file.copy(from = fl, to = file.path(output_dir, fl))
  file.remove(fl)
}
