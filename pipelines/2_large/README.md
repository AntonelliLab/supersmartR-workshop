# Large pipeline

This pipeline builds upon `1_multigene` to construct a phylogenetic tree from
multiple clusters for a large taxon (> 100 species).

## Steps

1. Choose taxonomic IDs for tree and root.
2. Download one of the pre-compiled `restez` databases for your taxon and place it in `pipelines/` with the name `restez_db`
2. Edit and run `1_phylotaR.R` for your taxonomic ID of interest.
3. Run `3_align.R`.
4. Edit and run `4_supermatrix.R` for your taxonomic ID of interest.
5. Run the remaining scripts.

**Notes.**

* See see [#data](https://github.com/AntonelliLab/supersmartR-workshop#data) for pre-compiled `restez` downloads
* In order to build an example tree to play with, you may want to be relaxed
with your cluster-selection and supermatrix-construction parameters

## New functionalities

* Use `restez` database to speed-up the download process.
* Specify a root taxon

## Choosing a taxonomic ID

Taxonomic IDs are based on those from NCBI. To select a taxonomic ID, you will
need to look up the 
[NCBI taxonomy page](https://www.ncbi.nlm.nih.gov/Taxonomy/taxonomyhome.html/)
and then search for your taxonomic group of interest.

*Make sure to select a large-ish clade (< 200 spp) in order for the pipeline to complete in reasonable time.*

For example, in the default pipeline, we are using [**Heteromyidae**](https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=10015),
a family of Kangaroo-rat-things. On NCBI this is a large-ish clade that is
associated with 129 taxomonic entities and 100,000 nucleotide records. It takes
between 5 to 10 minutes to run using the `restez` database.

![](https://upload.wikimedia.org/wikipedia/commons/5/50/Kangaroo-rat.jpg)

For the root taxon, we are using the
[**Castor**](https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=10184)
genus, i.e. beavers, because there are few of them but they have lots of
available sequence data. A good root taxon should:

* have few species (to avoid unnecessary computation)
* have lots of sequence data (to reduce data gaps)
* be phylogenetically close but also unambiguously not part of the in-group
