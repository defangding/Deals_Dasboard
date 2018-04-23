library(shinydashboard)
library(shiny)
library(devtools)
library("htmlwidgets")
## Load rpivotTable
library(rpivotTable)

ui <- dashboardPage(

  dashboardHeader(title = "GC Deals Dashboard",titleWidth = 300),
  
  dashboardSidebar( width = 300,
    sidebarMenu(id="tabs",
                menuItem("Deals", tabName = "deals", icon=icon("table")),
                menuItem("RPP", tabName = "rpp", icon=icon("table")),
                
                menuItem("ui.R", tabName = "ui", icon = icon("angle-right")),
                menuItem("server.R", tabName = "server", icon = icon("angle-right")),
                menuItem("About", tabName = "about", icon = icon("question"))
    )),
  
  dashboardBody(
    
    
  tags$style(type="text/css",".pvtRows, .pvtCols { background: #8FBC8B none repeat scroll 0 0; }" ),
  
    tags$head(tags$style(HTML('
      .main-header .logo {
        font-family: "Georgia", Times, "Times New Roman", serif;
        font-weight: bold;
        font-size: 24px;
      }
    '))),
    tabItems(
      
      ## tabItem(tabName ="deals",rpivotTableOutput("data") ),
      
      
      tabItem(tabName = "deals",
              box( width=NULL, solidHeader = TRUE, title="Deals Hub GMV", 
                   tags$head(tags$style( type = 'text/css',  '#data{ overflow-x: scroll; overflow-y: scroll; }')),
                   downloadButton('downloadTable', 'Download'),
                   br(),br(),
                   rpivotTableOutput("data",width = "100%", height = "500px")
              )),
      
      
      ##   tabItem(tabName = "rpp",
      ##          box( width = NULL, solidHeader = TRUE, title="RPP GMV",  
      ##              tags$head(tags$style( type = 'text/css',  '#data2{ overflow-x: scroll; overflow-y: scroll; }')),
      ##             downloadButton('downloadTable', 'Download'),
      ##              br(),br(),
      ##             rpivotTableOutput("data2")
      ##        )),
      
      
      tabItem(tabName ="rpp",rpivotTableOutput("data2")  ),
      
      
      
      tabItem(tabName = "ui",
              box( width = NULL, status = "primary", solidHeader = TRUE, title="ui.R",
                   downloadButton('downloadData2', 'Download'),
                   br(),br(),
                   pre(includeText("ui.R"))
              )
      ),
      
      
      tabItem(tabName = "server",
              box( width = NULL, status = "primary", solidHeader = TRUE, title="server.R",
                   downloadButton('downloadData3', 'Download'),
                   br(),br(),
                   pre(includeText("server.R"))
              ))
    )
    
  )
)
