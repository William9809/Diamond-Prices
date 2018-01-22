#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  selected <- reactive({
    s <- list()
    s[[1]] <- diamonds[diamonds$cut == input$cut &  diamonds$color == input$color & diamonds$clarity == input$clarity[1],]
    s[[2]] <- dim(s[[1]])[1]
    s
    })
  
  output$distPlot <- renderPlot({
  ggplot(data = selected()[[1]],aes(x = carat,y=price)) + geom_point() + stat_smooth(colour = "red")})
  output$return <- renderText({paste(
    "Sale prices for",input$cut,"cut,",input$color,"color,",
     input$clarity,"clarity diamonds.",selected()[[2]],"sales.")})

})
  

