#' Get path to dbexplorer example
#'
#' dbexplorer comes bundled with example SQLite database files located in its `inst/extdata` directory.
#' This function makes it easy to access those example databases.
#'
#' @param file Name of file. If `NULL`, the example SQLite database files will be listed.
#' @export
#' @examples
#' dbexplorer_example()
#' dbexplorer_example("chinook.sqlite")
dbexplorer_example <- function(file = NULL) {
  if (is.null(file)) {
    dir(system.file("extdata", package = "dbexplorer"))
  } else {
    system.file("extdata", file, package = "dbexplorer", mustWork = TRUE)

  }


}


