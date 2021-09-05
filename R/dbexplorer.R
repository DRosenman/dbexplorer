#'
#' Function to launch application for browsing database
#' The apps allows you to load, preview, and/or save any table in your database.
#'
#' @param db database connection
#'
#' @return
#' @export
#'
#' @example
#' dbexplorer(DBI::dbConnect(RSQLite::SQLite(), dbexplorer_example_connection('chinook.sqlite')), TRUE)

dbexplorer <- function(db, disconnect_on_exit = FALSE) {
  if(!is(db, "DBIConnection")) {
    stop("db must be a DBI Connection")
  }
  ui <- shiny::fluidPage(
    shiny::sidebarLayout(
      shiny::sidebarPanel(
        shiny::selectInput("table", "Tables", DBI::dbListTables(db)),
        shiny::actionButton("view", "View"),
        shiny::h3("Download"),
        shiny::radioButtons("type", "File Type", choices = c("csv" = ".csv", "tsv" = ".tsv", "xlsx" = ".xlsx")),
        shiny::downloadButton("download", "Save")
      ),
      shiny::mainPanel(
        DT::dataTableOutput("table")


      )
    )
  )

  server <- function(input, output, session) {
    df <- shiny::eventReactive(input$view, {
      DBI::dbReadTable(db, input$table)
    })

    output$table <- DT::renderDataTable(view_table(df()))

    shiny::onStop(
      function() {
      if(disconnect_on_exit) {
        DBI::dbDisconnect(db)
      }

    })


  }
  shiny::shinyApp(ui, server)
}
