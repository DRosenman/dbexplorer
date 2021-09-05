view_table <- function(df) {
  DT::datatable(df,
                options = list(pageLength = 50,
                               info = FALSE,
                               lengthMenu = list(c(25, 50, 100, -1),
                                                 c("25", "50", "100", "All"))))
}



