#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Diamond Price Graph"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       radioButtons("cut","Select cut",c("Fair","Good","Very Good","Premium","Ideal"),selected = "Fair"), 
       radioButtons("color","Select color",c("D","E","F","G","H","I","J"),selected = "D"),
       radioButtons("clarity","Select claritiy",c("SI2","SI1","VS1","VS2","VVS2","VVS1","I1","IF"),selected = "SI2")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot") ,
       textOutput("return") ,
       tags$div(
         h4('Documentation') ,
         p('The applications examines the sale prices for particular types of diamonds by caret (from ggplot2 diamonds dataset). Select the cut, color and clarity of diamonds for analysis on the left.') ,
         p('The graph above shows actual sales and a prediction line and band of uncertainty. The number of sales is also shown. Note: The output will "gray out" while a new selection is being run.')
       )      
    )
  )
))
