#############conncect with Teradata base ##################################
##library(RODBC)
##hopper <- odbcConnect("Hopper")
##install.packages("/home/defding/ebaytd_1.10 (1).tar.gz", repos = NULL, type = "source")

##library(ebaytd)
##teradataInit("defding", "DDFjuly1990#6")
##conn <- teradataConnect()


##NA_EU_DEALS<-dbGetQuery(conn,"select * from P_CAC_T.NA_EU_DEALS ")
##EU_RPP_ALL<-dbGetQuery(conn,"select * from P_CAC_T.EU_RPP_ALL ")

##NA_EU_DEALS$WEEK_BEG_DT  = as.Date(NA_EU_DEALS$WEEK_BEG_DT, format='%Y-%m-%d')
##EU_RPP_ALL$WEEK_BEG_DT  = as.Date(EU_RPP_ALL$WEEK_BEG_DT, format='%Y-%m-%d')



server<-function(input, output) {
  
  ##  datasetInput <- reactive({
  ##   switch(input$dataset,
  ####  "sp" = NA_EU_DEALS,
  ##       "deals"=EU_RPP_ALL)
  ##})
  
  
  output$data <- renderRpivotTable({
    rpivotTable( data=NA_EU_DEALS,rows="WEEK_BEG_DT",cols="DEAL SITE DETAIL",vals="GMV",aggregatorName ="Sum"
                   , rendererName = "Table",inclusions = list( YEAR  = list("2018")))
  })
  
  
  output$data2 <- renderRpivotTable({
     rpivotTable( data=EU_RPP_ALL,rows="WEEK_BEG_DT",cols="DEAL SITE DETAIL",vals="GMV",aggregatorName = "Sum",
               rendererName = "Table",inclusions = list( YEAR  = list("2018")))
  })
  
  
  
}

