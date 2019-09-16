# Select the clusters
# Generate a .fasta file of just 1 cluster identified by phylotaR

# Library ----
library(phylotaR)

# Vars ----
wd <- file.path(getwd(), 'pipelines', '0_base')
input_dir <- file.path(wd, '1_phylotaR')
output_dir <- file.path(wd, '2_clusters')
if (!dir.exists(output_dir)) {
  dir.create(output_dir)
}

# Read in ----
clusters <- read_phylota(input_dir)

# Extract best cluster ----
# Generate summary of identified clusters
smmry <- summary(clusters)
smmry <- smmry[smmry$MAD > 0.8, ]
smmry <- smmry[smmry$N_taxa > 3, ]
choice <- smmry[['ID']][[1]]
# Extract cluster
selected <- drop_clstrs(clusters, choice)
# Reduce cluster to just one sequence per taxon
selected <- drop_by_rank(selected, n = 1)
# Get taxonomic IDs for taxa in cluster
txids <- get_txids(selected, cid = selected@cids[[1]])
# Convert IDs to species names
sp_nms <- get_tx_slot(selected, txids, slt_nm = 'scnm')
sp_nms <- sub(' ', '_', sp_nms)
# Write out
output_file <- file.path(output_dir, 'selected.fasta')
write_sqs(selected, output_file, sq_nm = sp_nms, sid = names(sp_nms))

# View output file ----
# What do the first 50 lines of the file look like?
# cat(paste0(readLines('aotus_cytb.fasta', n = 50), collapse = '\n'))
