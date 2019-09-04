# Run the entire pipeline
start_time <- Sys.time()
pipeline_dir <- 'simple_pipeline'
stage_scripts <- list.files(path = pipeline_dir, pattern = '\\.R')
stage_scripts <- stage_scripts[stage_scripts != 'run_script.R']
cat(cli::rule())
cat('Running ', crayon::green(pipeline_dir), ' ....\n', sep = '')
cat(cli::rule())
for (stage_script in stage_scripts) {
  cat('.... ', crayon::green(stage_script), '\n', sep = '')
  stage_env <- new.env()
  source(file = file.path(pipeline_dir, stage_script), echo = FALSE,
         local = stage_env)
}
end_time <- Sys.time()
duration <- difftime(end_time, start_time, units = 'mins')
cat('Duration: ', crayon::red(duration), ' minutes.\n')
cat(cli::rule())
