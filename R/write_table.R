write_table <- function(df, path) {

  extension <- tools::file_ext(path)
  fnc <- c(csv = data.table::fwrite, tsv = data.table::fwrite, xlsx = openxlsx::write.xlsx)[[extension]]
  fnc(df, path)

}
