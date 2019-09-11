# Select the clusters
# Generate a .fasta file of multiple clusters identified by phylotaR

# Library ----
library(phylotaR)

# Vars ----
min_nspp <- 20
wd <- file.path(getwd(), 'pipelines', '3_supertree')
input_dir <- file.path(wd, '1_phylotaR')
output_dir <- file.path(wd, '2_clusters')
if (!dir.exists(output_dir)) {
  dir.create(output_dir)
}

# Read in ----
clusters <- read_phylota(input_dir)

# Taxonomic tree ----
tree_dir <- file.path(wd, '6_supertree')
tree_flpth <- file.path(tree_dir, 'supertree.tre')
if (!file.exists(tree_flpth)) {
  if (!dir.exists(tree_dir)) {
    dir.create(tree_dir)
  }
  tree <- clusters@txdct@txtr
  scientific_names <- get_tx_slot(phylota = clusters, txid = tree@tips,
                                  slt_nm = 'scnm')
  scientific_names <- gsub('\\.', '', scientific_names)
  scientific_names <- gsub('\\s+', '_', scientific_names)
  scientific_names <- gsub('[^a-zA-Z0-9_]', '_', scientific_names)
  tree <- treeman::setNdsID(tree = tree, ids = tree@tips,
                            vals = scientific_names)
  n_ids <- vapply(X = treeman::getNdsSlt(tree = tree, slt_nm = 'ptid',
                                         ids = tree@nds), FUN = length,
                  FUN.VALUE = integer(1))
  singleton_nodes <- names(n_ids)[n_ids == 1]
  tree <- treeman::rmNodes(tree = tree, nids = singleton_nodes)
  if (!treeman::fastCheckTreeMan(tree)) {
    warning('Unable to correct tree.')
  }
  treeman::writeTree(tree = tree, file = tree_flpth)
}

# Extract clusters ----
cids <- clusters@cids
n_taxa <- get_ntaxa(phylota = clusters, cid = cids)
keep <- cids[n_taxa > min_nspp]
selected <- drop_clstrs(phylota = clusters, cid = keep)
smmry <- summary(selected)
# TODO: fix dups
# >>> patch
# drop duplicated (likely artefact of multiple IDs)
dups <- unique(smmry$Seed[duplicated(smmry$Seed)])
for (dup in dups) {
  indxs <- which(smmry$Seed == dup)
  n_seqs <- smmry[indxs, 'N_seqs']
  keep <- which(n_seqs == max(n_seqs))[1]
  to_drop <- indxs[-1*keep]
  smmry <- smmry[-1*to_drop, ]
}
selected <- drop_clstrs(phylota = selected, cid = smmry$ID)
# <<<<
reduced <- drop_by_rank(phylota = selected, rnk = 'species', n = 1)
smmry <- summary(reduced)

# Write out ----
for (i in seq_len(nrow(smmry))) {
  cid <- smmry[i, 'ID']
  txids <- get_txids(phylota = reduced, cid = cid, rnk = 'species')
  scientific_names <- get_tx_slot(phylota = reduced, txid = txids,
                                  slt_nm = 'scnm')
  scientific_names <- gsub('\\.', '', scientific_names)
  scientific_names <- gsub('\\s+', '_', scientific_names)
  scientific_names <- gsub('[^a-zA-Z0-9_]', '_', scientific_names)
  sids <- reduced@clstrs[[cid]]@sids
  gene_nm <- sub(pattern = '\\s.*$', replacement = '', smmry[i, 'Feature'])
  if (nchar(gene_nm) <= 3) {
    gene_nm <- paste0(i, '_cluster')
  }
  write_sqs(phylota = reduced, sid = sids, sq_nm = scientific_names,
            outfile = file.path(output_dir, paste0(gene_nm, '.fasta')))
}
