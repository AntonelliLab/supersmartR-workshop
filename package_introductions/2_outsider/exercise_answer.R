# Libs ----
library(outsider)

# Search ----
# all available modules
repos <- module_search()
# find mafft one
repo <- repos[grepl(pattern = 'mafft', x = repos)]

# Install ----
module_install(repo = repo)

# Import ----
mafft <- module_import('mafft', repo)

# Align ----
seqs_file <- file.path(getwd(), 'package_introductions', '3_outsider',
                       'ex_seqs.fasta')
al_file <- file.path(getwd(), 'package_introductions', '3_outsider',
                     'ex_al.fasta')
mafft(arglist = c('--auto', seqs_file, '>', al_file))
