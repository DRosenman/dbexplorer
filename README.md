
# dbexplorer

<!-- badges: start -->
<!-- badges: end -->

dbexplorer provides a shiny app that allows you to explorer and download all tables in any database that you are able to connect to via the DBI package.

## Installation



``` r
devtools::install_github("drosenman/dbexplorer")
```

## Use

All you need is to create a database connection using the DBI package and pass that database connection to the `run_app` function. A shiny app will then run which will allow you to view all tables in the database and have the option to export tables.
```r
library(dbexplorer)
db <- DBI::db_connect(RSQLite::SQLite(), sample_database())
run_app(db)
```


