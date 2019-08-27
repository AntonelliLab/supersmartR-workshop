library(phylotaR)
# Example data
data("aotus")
# Generate summary of identified clusters
smmry <- summary(aotus)
# Extract cluster with 'cytb' in feature name
cytb <- smmry$ID[which(grepl('cytb', smmry$Feature))[1]]
cytb <- drop_clstrs(aotus, cytb)
# Reduce cluster to just one sequence per taxon
cytb <- drop_by_rank(cytb, n = 1)
# Get taxonomic IDs for taxa in cluster
txids <- get_txids(cytb, cid = cytb@cids[[1]])
# Convert IDs to species names
sp_nms <- get_tx_slot(cytb, txids, slt_nm = 'scnm')
sp_nms <- sub(' ', '_', sp_nms)
# Write out
write_sqs(cytb, 'aotus_cytb.fasta', sq_nm = sp_nms, sid = names(sp_nms))
# What do the first 50 lines of the file look like?
cat(paste0(readLines('aotus_cytb.fasta', n = 50), collapse = '\n'))