
# Tools ----
download_rodent_data <- function(wd) {
  res_path <- file.path(wd, 'rodents')
  durl <- "https://drive.google.com/uc?export=download&id=1kUCKsLflUistf7ZnBKCsWZeh269u5ec1"
  if (!dir.exists(res_path)) {
    flpth <- file.path(tempdir(), 'test_rodent_data')
    if (!dir.exists(flpth)) {
      dir.create(flpth)
      download.file(url = durl, destfile = file.path(flpth, 'rodent.zip'))
      utils::unzip(zipfile = file.path(flpth, 'rodent.zip'), exdir = flpth)
      dir.create(res_path)
      contents <- list.files(path = file.path(flpth, 'supertree_phylotaR'))
      file.copy(from = file.path(flpth, 'supertree_phylotaR', contents),
                to = res_path, recursive = TRUE)
      unlink(x = flpth, recursive = TRUE, force = TRUE)
    }
  }
}

# Libs ----
library(phylotaR)

# Vars ----
wd <- file.path(getwd(), 'package_introductions', '1_phylotaR')

# Download ----
download_rodent_data(wd = wd)

# Read in ----
# N.B. this isn't actually ALL the rodents
clusters <- read_phylota(wd = file.path(wd, 'rodents'))

# Parse ----
smmry <- summary(clusters)
pull <- smmry$MAD >= 0.5 & smmry$N_taxa >= 20
cids <- smmry$ID[pull]

# Reduce
clusters <- drop_clstrs(phylota = clusters, cid = cids)
clusters <- drop_by_rank(phylota = clusters, rnk = 'species', n = 1)

# Write out
outdir <- file.path(wd, 'clusters')
if (!dir.exists(outdir)) {
  dir.create(outdir)
}
cids <- clusters@cids
for (cid in cids) {
  # fetch sids
  sids <- clusters@clstrs[[cid]]@sids
  # fetch txids at species rank
  txids <- get_txids(phylota = clusters, sid = sids, rnk = 'species')
  # convert to sci names
  scnms <- get_tx_slot(phylota = clusters, txid = txids, slt_nm = 'scnm')
  # write out
  outfile <- file.path(outdir, paste0('cluster_', cid, '.fasta'))
  write_sqs(phylota = clusters, sid = sids, sq_nm = scnms, outfile = outfile)
}
