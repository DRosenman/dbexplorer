#' Explorer the sample `chinook` database
#'
#'   Example app run using popular `chinook` sample database.
#'
#'
#' @return
#' @export
#'
run_example <- function() {
  db <- DBI::dbConnect(RSQLite::SQLite(), sample_database())
  run_app(db, disconnect_on_exit = TRUE)
}
