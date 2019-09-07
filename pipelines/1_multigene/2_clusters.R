# Select the clusters
# Generate a .fasta file of multiple clusters identified by phylotaR

# Library ----
library(phylotaR)

# Vars ----
min_nspp <- 6
wd <- file.path(getwd(), 'pipelines', '1_multigene')
input_dir <- file.path(wd, '1_phylotaR')
output_dir <- file.path(wd, '2_clusters')
if (!dir.exists(output_dir)) {
  dir.create(output_dir)
}

# Read in ----
clusters <- read_phylota(input_dir)

# Extract clusters ----
cids <- clusters@cids
n_taxa <- get_ntaxa(phylota = clusters, cid = cids)
keep <- cids[n_taxa > min_nspp]
selected <- drop_clstrs(phylota = clusters, cid = keep)
smmry <- summary(selected)
reduced <- drop_by_rank(phylota = selected, rnk = 'species', n = 1)

# Write out ----
for (i in seq_len(nrow(smmry))) {
  cid <- smmry[i, 'ID']
  txids <- get_txids(phylota = reduced, cid = cid, rnk = 'species')
  scientific_names <- get_tx_slot(phylota = reduced, txid = txids,
                                  slt_nm = 'scnm')
  scientific_names <- gsub('\\.', '', scientific_names)
  scientific_names <- gsub('\\s+', '_', scientific_names)
  sids <- reduced@clstrs[[cid]]@sids
  gene_nm <- sub(pattern = '\\s.*$', replacement = '', smmry[i, 'Feature'])
  if (nchar(gene_nm) <= 3) {
    gene_nm <- paste0(i, '_cluster')
  }
  write_sqs(phylota = reduced, sid = sids, sq_nm = scientific_names,
            outfile = file.path(output_dir, paste0(gene_nm, '.fasta')))
}
