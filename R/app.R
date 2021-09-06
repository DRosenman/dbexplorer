#' shiny database explorer app
#'
#' Function to launch a shiny application for browsing database.
#' The apps allows you to load, preview, and/or save any table in your database.
#'
#' @param db database connection
#' @param disconnect_on_exit if TRUE, database connection will be closed when app is stopped
#'
#' @return
#' @export
#'
#' @return shiny application object
#' @examples
#' # run_app(DBI::dbConnect(RSQLite::SQLite(), sample_database()), TRUE)



run_app <- function(db, disconnect_on_exit = FALSE) {
  if(!is(db, "DBIConnection")) {
    stop("db must be a DBI Connection")
  }
  ui <- shiny::fluidPage(
    shinyjs::useShinyjs(),
    shiny::sidebarLayout(
      shiny::sidebarPanel(
        shiny::selectInput("table", "Tables", DBI::dbListTables(db)),
        shiny::actionButton("view", "View"),
        shiny::h3("Download"),
        shiny::radioButtons("extension", "File Type", choices = c("csv" = ".csv", "tsv" = ".tsv", "xlsx" = ".xlsx")),
        shiny::downloadButton("download", "Save")
      ),
      shiny::mainPanel(
        DT::dataTableOutput("table")


      )
    )
  )

  server <- function(input, output, session) {

    shinyjs::disable(id="download")
    observeEvent(input$view, {
      shinyjs::enable(id="download")
    })

    df <- shiny::eventReactive(input$view, {
      DBI::dbReadTable(db, input$table)
    })

    output$table <- DT::renderDataTable(view_table(df()))

    output$download <- downloadHandler(
      filename = function() {
        paste0(input$table, input$extension)
      },
      content = function(file) {
        write_table(df(), file)
      }
    )
    observe(print(paste(input$table, input$extension, sep="")))
    shiny::onStop(
      function() {
      if(disconnect_on_exit) {
        DBI::dbDisconnect(db)
      }

    })


  }
  shiny::shinyApp(ui, server)
}
