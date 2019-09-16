# Multigene phylogenetic pipeline

This pipeline builds upon `0_base` to construct a phylogenetic tree from
multiple clusters.

## Steps

1. Copy `0_base/1_phylotaR/` to this directory.
2. Edit and run `2_clusters.R` for your taxonomic ID of interest.
3. Run `3_align.R`.
4. Edit and run `4_supermatrix.R` for your taxonomic ID of interest.
5. Run the remaining scripts.

## New functionalities

* Select multiple gene/clusters based on user-set criteria
* Combine multiple alignments into a supermartix based on number of gaps
