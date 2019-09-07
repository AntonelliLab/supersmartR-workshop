# Libs ----
library(restez)

# Vars ----
wd <- file.path(getwd(), 'pipelines', '2_large')
restez_path <- file.path(wd, 'restez_db')

# Set up ----
if (!dir.exists(restez_path)) {
  dir.create(restez_path)
  restez_path_set(filepath = restez_path)
  db_download(preselection = 16)  # "Rodents"
  restez_connect()
  db_create(min_length = 500, max_length = 5000)
  restez_disconnect()
}

# Status check ----
restez_path_set(filepath = restez_path)
restez_connect()
restez_status()
restez_disconnect()
