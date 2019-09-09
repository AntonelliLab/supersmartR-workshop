# Libs ----
library(restez)

# Vars ----
gb_section <- '16' # Rodents
wd <- file.path(getwd(), 'pipelines', '3_supertree')
restez_path <- file.path(wd, 'restez_db')

# Set up ----
if (!dir.exists(restez_path)) {
  dir.create(restez_path)
  restez_path_set(filepath = restez_path)
  db_download(preselection = gb_section)
  restez_connect()
  db_create(min_length = 500, max_length = 5000)
  restez_disconnect()
}

# Status check ----
restez_path_set(filepath = restez_path)
restez_connect()
restez_status()
restez_disconnect()
