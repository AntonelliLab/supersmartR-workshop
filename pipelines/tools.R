
scientific_names_get <- function(cid, phylota) {
  # return named character vector of scientific names
  sids <- phylota@clstrs[[cid]]@sids
  txids <- phylotaR::get_txids(phylota = phylota, sid = sids, rnk = 'species')
  scientific_names <- phylotaR::get_tx_slot(phylota = phylota, txid = txids,
                                            slt_nm = 'scnm')
  scientific_names <- gsub('\\.', '', scientific_names)
  scientific_names <- gsub('\\s+', '_', scientific_names)
  scientific_names <- gsub('[^a-zA-Z0-9_]', '_', scientific_names)
  names(scientific_names) <- sids
  scientific_names
}

duplicates_drop <- function(phylota) {
  # Correct phylotaR error: duplicated clusters for multiple ID search
  seeds <- phylotaR::get_clstr_slot(phylota = phylota, cid = phylota@cids,
                                    slt_nm = 'seed')
  dups <- unique(seeds[duplicated(seeds)])
  to_drop <- NULL
  for (dup in dups) {
    cids <- phylota@cids[seeds == dup]
    nsqs <- phylotaR::get_clstr_slot(phylota = phylota, cid = cids,
                                     slt_nm = 'nsqs')
    to_drop <- c(to_drop, cids[-1 * which.max(nsqs)])
  }
  keep <- phylota@cids[!phylota@cids %in% to_drop]
  res <- drop_clstrs(phylota = phylota, cid = keep)
  res
}

taxtree_generate <- function(phylota, tree_flpth) {
  # phylota: phylota table object
  # tree_flpth: output file path
  tree <- phylota@txdct@txtr
  scientific_names <- phylotaR::get_tx_slot(phylota = phylota, txid = tree@tips,
                                            slt_nm = 'scnm')
  scientific_names <- gsub('\\.', '', scientific_names)
  scientific_names <- gsub('\\s+', '_', scientific_names)
  scientific_names <- gsub('[^a-zA-Z0-9_]', '_', scientific_names)
  tree <- treeman::setNdsID(tree = tree, ids = tree@tips,
                            vals = scientific_names)
  n_ids <- vapply(X = treeman::getNdsSlt(tree = tree, slt_nm = 'ptid',
                                         ids = tree@nds), FUN = length,
                  FUN.VALUE = integer(1))
  singleton_nodes <- names(n_ids)[n_ids == 1]
  tree <- treeman::rmNodes(tree = tree, nids = singleton_nodes)
  if (!treeman::fastCheckTreeMan(tree)) {
    warning('Unable to correct tree.')
  }
  treeman::writeTree(tree = tree, file = tree_flpth)
}

supertree_generate <- function(mono_tree_files, backbone_file, output_file) {
  # create supertree
  trees <- list()
  for (i in seq_along(mono_tree_files)) {
    id <- sub(pattern = '^.*\\.', replacement = '', x = mono_tree_files[[i]])
    tree <- treeman::readTree(file = mono_tree_files[[i]])
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
