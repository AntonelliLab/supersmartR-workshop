# Generate supertree

# Library ----
supertree_generate <- NULL
source(file.path('pipelines', 'tools.R'))

# Vars ----
wd <- file.path(getwd(), 'pipelines', '3_supertree')
input_dir <- file.path(wd, '5_phylogeny')
output_file <- file.path(wd, '6_supertree', 'supertree_2.tre')

# Supertree ----
mono_tree_files <- file.path(input_dir, list.files(path = input_dir,
                                                   pattern = 'bestTree'))
pull <- grepl(pattern = 'backbone', x = mono_tree_files)
backbone_file <- mono_tree_files[pull]
mono_tree_files <- mono_tree_files[!pull]
supertree_generate(mono_tree_files = mono_tree_files,
                   backbone_file = backbone_file, output_file = output_file)
