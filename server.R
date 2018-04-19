server<-function(input, output) {
  
  ##  datasetInput <- reactive({
  ##   switch(input$dataset,
  ####  "sp" = NA_EU_DEALS,
  ##       "deals"=EU_RPP_ALL)
  ##})
  
  
  output$data <- renderRpivotTable({
    rpivotTable( data=NA_EU_DEALS,rows="WEEK_BEG_DT",cols="DEAL SITE DETAIL",vals="GMV",aggregatorName = "Sum",
                 rendererName = "Table",inclusions = list( YEAR  = list("2018")))
  })
  
  
  output$data2 <- renderRpivotTable({
    rpivotTable( data=EU_RPP_ALL,rows="WEEK_BEG_DT",cols="DEAL SITE DETAIL",vals="GMV",aggregatorName = "Sum",
                 rendererName = "Table",inclusions = list( YEAR  = list("2018")))
  })
  
  
  
}