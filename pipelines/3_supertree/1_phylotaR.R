# Run phylotaR
# Search NCBI for a chosen taxonomic group, download and identify sequence
#  clusters

# Library ----
library(phylotaR)
library(restez)

# Vars ----
wd <- file.path(getwd(), 'pipelines', '3_supertree')
restez_path <- file.path(getwd(), 'pipelines', 'restez_db')
wd <- file.path(wd, '1_phylotaR')
if (dir.exists(wd)) {
  unlink(x = wd, recursive = TRUE, force = TRUE)
}
dir.create(wd)
txid <- 33550  # Hystricomorpha
root_txid <- 10184 # Castor genus

# Restez connect ----
restez_path_set(filepath = restez_path)
restez_connect()

# Run ----
setup(wd = wd, txid = c(txid, root_txid), v = FALSE, ncps = 2, outsider = TRUE,
      mnsql = 500, db_only = TRUE)
run(wd = wd)

# Restez disconnect ----
restez_disconnect()
