# Run phylotaR
# Search NCBI for a chosen taxonomic group, download and identify sequence
#  clusters

# Library ----
library(phylotaR)

# Vars ----
# assuming getwd() returns the directory to where `supersmartR-workshop/` exists
wd <- file.path(getwd(), 'pipelines', '0_base')
wd <- file.path(wd, '1_phylotaR')
if (dir.exists(wd)) {
  unlink(x = wd, recursive = TRUE, force = TRUE)
}
dir.create(wd)
txid <- 9504  # aotus ID

# Run ----
setup(wd = wd, txid = txid, v = FALSE, ncps = 2, outsider = TRUE)
run(wd = wd)
