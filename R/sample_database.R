#' Get path to dbexplorer example
#'
#' dbexplorer comes bundled with an example SQLite database file, the popular `chinook` database, located in its `inst/extdata` directory.
#' This function provides the path to that database file.
#'
#' @export
#' @examples
#' sample_database()
sample_database <- function() {
  system.file("extdata", "chinook.sqlite", package = "dbexplorer", mustWork = TRUE)




}

