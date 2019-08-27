# Select the clusters
# Generate a .fasta file of just 1 cluster identified by phylotaR

# Library ----
library(phylotaR)

# Vars ----
input_dir <- file.path('simple_pipeline', '1_phylotaR')
output_dir <- file.path('simple_pipeline', '2_clusters')
if (!dir.exists(output_dir)) {
  dir.create(output_dir)
}

# Read in ----
# TODO fix
# clusters <- read_phylota(input_dir)
data(aotus)
clusters <- aotus

# Extract cytb ----
# Generate summary of identified clusters
smmry <- summary(clusters)
# Extract cluster with 'cytb' in feature name
cytb <- smmry$ID[which(grepl('cytb', smmry$Feature))[1]]
cytb <- drop_clstrs(clusters, cytb)
# Reduce cluster to just one sequence per taxon
cytb <- drop_by_rank(cytb, n = 1)
# Get taxonomic IDs for taxa in cluster
txids <- get_txids(cytb, cid = cytb@cids[[1]])
# Convert IDs to species names
sp_nms <- get_tx_slot(cytb, txids, slt_nm = 'scnm')
sp_nms <- sub(' ', '_', sp_nms)
# Write out
output_file <- file.path(output_dir, 'aotus_cytb.fasta')
write_sqs(cytb, output_file, sq_nm = sp_nms, sid = names(sp_nms))

# View output file ----
# What do the first 50 lines of the file look like?
# cat(paste0(readLines('aotus_cytb.fasta', n = 50), collapse = '\n'))
