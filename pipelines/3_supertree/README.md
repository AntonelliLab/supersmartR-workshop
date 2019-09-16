# Supertree pipeline

This pipeline builds upon `1_large` to construct a phylogenetic tree from
multiple clusters for a pretty large taxon (> 500 species).

## Steps

1. Choose taxonomic IDs for tree and root.
2. Download one of the pre-compiled `restez` databases for your taxon and place it in `pipelines/` with the name `restez_db`
2. Edit and run `1_phylotaR.R` for your taxonomic ID of interest.
3. Run `3_align.R`.
4. Edit and run `4_supermatrix.R` for your taxonomic ID of interest.
5. Run the remaining scripts.

**Notes.**

* You can download the completed first step `1_phylotaR`, see [#data](https://github.com/AntonelliLab/supersmartR-workshop#data)
* To save time, we are restricting sequence retrieval to the `restez`
database (`db_only = TRUE`).

## New functionalities

* Break the analysis up into species-level and backbone phylogenetic trees
* Combine the resulting trees into a supertree

## Choosing a taxonomic ID

*Select a large clade (< 500 spp).*

In the default pipeline, we are using [**Hystricomorpha**](https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=10015),
guinea pigs and allies.

![](https://upload.wikimedia.org/wikipedia/commons/f/fc/Two_Adult_Guinea_Pigs_%28cropped%29.jpg)
