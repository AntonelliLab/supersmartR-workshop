supertree_generate <- function(mono_tree_files, backbone_file, output_file) {
  tree_files <- list.files(path = mono_tree_files, pattern = 'bestTree')
  trees <- list()
  for (i in seq_along(tree_files)) {
    id <- sub(pattern = '^.*\\.', replacement = '', x = tree_files[[i]])
    tree <- treeman::readTree(file = tree_files[[i]])
    nids <- tree@nds
    new_nids <- paste0(id, '_', nids)
    trees[[id]] <- treeman::setNdsID(tree = tree, ids = nids, vals = new_nids)
  }
  supertree <- treeman::readTree(file = backbone_file)
  for (id in names(trees)) {
    if (id %in% supertree@tips) {
      supertree <- treeman::addClade(tree = supertree, id = id,
                                     clade = trees[[id]])
    }
  }
  supertree <- treeman::setNdsSpn(tree = supertree, ids = supertree@all,
                                  vals = 0)
  #summary(supertree)
  treeman::writeTree(tree = supertree, file = output_file)
}
