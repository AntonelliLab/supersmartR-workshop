# Select the clusters
# Generate a .fasta file of multiple clusters identified by phylotaR

# Library ----
duplicates_drop <- taxtree_generate <- scientific_names_get <- NULL
source(file.path('pipelines', 'tools.R'))
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
# correct phylotaR error
clusters <- duplicates_drop(clusters)

# Taxonomic tree ----
tree_dir <- file.path(wd, '6_supertree')
tree_flpth <- file.path(tree_dir, 'supertree.tre')
if (!file.exists(tree_flpth)) {
  if (!dir.exists(tree_dir)) {
    dir.create(tree_dir)
  }
  taxtree_generate(phylota = clusters, tree_flpth = tree_flpth)
}

# Extract clusters ----
cids <- clusters@cids
n_taxa <- get_ntaxa(phylota = clusters, cid = cids)
keep <- cids[n_taxa > min_nspp]
selected <- drop_clstrs(phylota = clusters, cid = keep)
reduced <- drop_by_rank(phylota = selected, rnk = 'species', n = 1)
smmry <- summary(reduced)

# Write out ----
for (i in seq_len(nrow(smmry))) {
  cid <- smmry[i, 'ID']
  scientific_names <- scientific_names_get(cid = cid, phylota = reduced)
  gene_nm <- sub(pattern = '\\s.*$', replacement = '', smmry[i, 'Feature'])
  if (nchar(gene_nm) <= 3) {
    gene_nm <- paste0(i, '_cluster')
  }
  write_sqs(phylota = reduced, sid = names(scientific_names),
            sq_nm = scientific_names,
            outfile = file.path(output_dir, paste0(gene_nm, '.fasta')))
}
