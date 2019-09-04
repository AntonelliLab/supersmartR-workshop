library(restez)
# create database
rstz_pth <- file.path(tempdir(), 'phages_database')
if (!dir.exists(rstz_pth)) {
  dir.create(rstz_pth)
}
restez_path_set(filepath = rstz_pth)
db_download(preselection = '19')
restez_connect()
db_create()
# get list of ALL IDs in database
ids <- list_db_ids(n = NULL)
# get all organisms
organisms <- gb_organism_get(ids)
# parse for Escherichia
is_escherichia <- grepl('escherichia', organisms, ignore.case = TRUE)
# fetch fasta formatted sequences
fastas <- gb_fasta_get(ids[is_escherichia])
# sanity check ...
cat(fastas[1])
# write out
write(fastas, file = 'phage_seqs.fasta')
