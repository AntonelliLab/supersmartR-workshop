# Run phylotaR
# Search NCBI for a chosen taxonomic group, download and identify sequence
#  clusters

# Library ----
library(phylotaR)
library(restez)

# Vars ----
wd <- file.path(getwd(), 'pipelines', '3_supertree')
restez_path <- file.path(wd, 'restez_db')
wd <- file.path(wd, '1_phylotaR')
if (dir.exists(wd)) {
  unlink(x = wd, recursive = TRUE, force = TRUE)
}
dir.create(wd)
ncbi_dr <- '/usr/bin/'
txid <- 33550  # Hystricomorpha
root_txid <- 10184 # Castor genus

# Restez connect ----
restez_path_set(filepath = restez_path)
restez_connect()

# Run ----
# started 1549
setup(wd = wd, txid = c(txid, root_txid), ncbi_dr = ncbi_dr, v = FALSE,
      ncps = 2)
run(wd = wd)

# Restez disconnect ----
restez_disconnect()
