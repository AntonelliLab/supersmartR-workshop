# Libs ----
library(ssh)
library(outsider)

# SSH ----
host_info <- readRDS(file = file.path(getwd(), 'advanced_topics',
                                      'private_host_info.RData'))
# host info should be of the form "username@ip.address:port"
# this will not work for you, you will need to put in your own private host
session <- ssh_connect(host = host_info)
ssh_setup(session)

# Run ----
# repeat mafft exercise
repo <- 'dombennett/om..mafft'
if (!is_module_installed(repo = repo)) {
  module_install(repo = repo)
}
mafft <- module_import(fname = 'mafft', repo = repo)
seqs_file <- file.path(getwd(), 'advanced_topics', 'ex_seqs.fasta')
if (!file.exists(seqs_file)) {
  download.file(url = 'https://mafft.cbrc.jp/alignment/software/ex1.txt',
                destfile = seqs_file)
}
al_file <- file.path(getwd(), 'advanced_topics', 'ex_al.fasta')
# mafft will run on host computer
mafft(arglist = c('--thread', '2', '--auto', seqs_file, '>', al_file))

# Clean up ----
ssh_teardown()
