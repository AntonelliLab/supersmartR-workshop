# Base phylogenetic pipeline

This pipeline consists of a series of R scipts for constructing a phylogenetic
tree for a single gene/cluster. The order in which the scripts are run is
indicated by the prefixed number.

## Steps

1. Choose a taxonomic ID.
2. Edit the first script, `1_phylotaR.R` for your taxonomic ID of interest.
3. Run the first script.
4. Edit the second script, `2_cluster.R` to identify your cluster of choice
5. Run the second script.
6. Edit `3_align.R` for your clade/gene pair.
7. Run the third script.
8. Edit `4_phylogeny.R` for your clade/gene pair.
9. Run the fourth script.
10. Run `5_view.R` to visualise the tree.

(`../run_script.R` launches all the scripts in order.)

## Choosing a taxonomic ID

Taxonomic IDs are based on those from NCBI. To select a taxonomic ID, you will
need to look up the 
[NCBI taxonomy page](https://www.ncbi.nlm.nih.gov/Taxonomy/taxonomyhome.html/)
and then search for your taxonomic group of interest.

*Make sure to select a small clade (< 10 spp) in order for the pipeline to complete in reasonable time.*

For example, in the default pipeline, we are using [**Aotus**](https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=9504),
a genus of Night Owl Monkeys. On NCBI this is a small clade that is associated
with only 21 taxomonic entities and 100,000 nucleotide records. It takes between
5 to 10 minutes to run.

![](https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Panamanian_night_monkey.jpg/180px-Panamanian_night_monkey.jpg)

To get an idea of how long the pipeline should take, see the table below on the
`phylotaR` run times for different taxonomic groups.


Taxon|N. taxa|N. sequences|N. clusters|Taxise (mins.)|Download (mins.)|Cluster (mins.)|Cluster2 (mins.)|Total (mins.)|
|:--|--:|--:|--:|--:|--:|--:|--:|--:|
Anisoptera|1175|11432|796|1.6|23|48|0.017|72|
Acipenseridae|51|2407|333|0.1|6.9|6.4|0.017|13|
Tinamiformes|25|251|98|0.067|2.4|0.18|0.017|2.7|
Aotus|13|1499|193|0.067|3.2|0.6|0|3.9|
Bromeliaceae|1171|9833|724|1.2|28|37|0.033|66|
Cycadidae|353|8331|540|0.32|19|18|0.033|37|
Eutardigrada|261|960|211|0.3|11|1.8|0.05|14|
Kazachstania|40|623|101|0.1|20|3|0.05|23|
Platyrrhini|212|12731|3112|0.35|51|6.9|1.2|60|

(Note: These times are for running `phylotaR` only, not the entire pipeline.)


