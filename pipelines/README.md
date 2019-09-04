# Pipelines

File structure and scripts for generating phylogenetic trees using `supersmartR` packages.

`0_base` introduces the main components of a pipeline and builds a gene for a taxonomic group.
Subsequent pipelines (`1_`, `2_`, ...) build on this base for more complex phylogenetic approaches.

`run_script.R` will run each script of a pipeline in order, it will also add
timestamps. For a pipeline to run successfully with this script each stage
script must run independently and have a `#_name.R` naming convention, where `#`
indicates the order in which the script will be called.
