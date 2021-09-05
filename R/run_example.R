#' Run the app and dbexplorer shiny app using the `chinook` database
#'
#'
#' @return
#' @export
#'
run_example <- function() {
  db <- DBI::dbConnect(RSQLite::SQLite(), sample_database())
  run_app(db, disconnect_on_exit = TRUE)
}
