# Var ----
# choose the pipeline to run
pipeline_dir <- file.path(getwd(), 'pipelines', '0_base')
# hide any output printing to screen for outsider
outsider::verbosity_set(show_program = FALSE, show_docker = FALSE)

# Run the entire pipeline
if (!dir.exists(pipeline_dir)) {
  stop('Invalid directory')
}
start_time <- Sys.time()
# identify stage scripts by naming convention: #_name.R
stage_scripts <- list.files(path = pipeline_dir, pattern = '\\.R')
stage_scripts <- stage_scripts[grepl(pattern = '^[0-9]+[a-zA-Z0-9_]+\\.R$',
                                     x = stage_scripts)]
stage_scripts <- sort(stage_scripts)
cat(cli::rule())
cat('Running ', crayon::green(pipeline_dir), ' ....\n', sep = '')
cat(cli::rule())
for (stage_script in stage_scripts) {
  cat('.... ', crayon::green(stage_script), '\n', sep = '')
  stage_env <- new.env()
  source(file = file.path(pipeline_dir, stage_script), echo = FALSE,
         local = stage_env, print.eval = FALSE)
}
end_time <- Sys.time()
duration <- difftime(end_time, start_time, units = 'mins')
cat('Duration: ', crayon::red(round(x = duration, digits = 3)), ' minutes.\n')
cat(cli::rule())
