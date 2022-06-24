#Different Plots with Navigation Bar on COVID-19 Dataset

library(tidyverse)
library(dplyr) 
library(shiny)
library(shinythemes)
library(ggplot2)
library(plotly)

dataset <- read.csv("C:/Users/DELL/Desktop/COVID 19 APP/COVID19_line_list_data.csv")

dataset$dead_dummy = as.integer(dataset$death !=0)
dataset$recovered_dummy = as.integer(dataset$alive !=0)
dataset$total = sum(dead_dummy, recovered_dummy)



ui <- fluidPage(theme = shinytheme("cerulean"),
                navbarPage(
                  "COVID-19 Analysis",
                  tabPanel("Tab 1",
                           
                           sidebarPanel(
                             selectInput(
                               inputId = "Country",
                               label = "Select Country",
                               choices = c("China","Japan","USA","Australia","Germany","Italy", "Russia", "UK", "India","France"),
                               selected = "India"
                             ),
                             
                             selectInput(
                               inputId = "Gender",
                               label = "Select Gender",
                               choices = c("Male","Female"),
                               selected = "Male"
                             ),
                             
                             sliderInput(
                               inputId="Age", 
                               label="Select Age", 
                               min=20,
                               max=90, 
                               step=10,
                               value= 30
                             ),
                             
                           ),
                           
                           
                           mainPanel(
                             h1("Plot"),
                             #h4("Plot"),
                             plotOutput("No_Plot"),
                           ),
                           
                           
                  ),
                  tabPanel("Tab2","Arriving Soon"),
                  tabPanel("Tab3","Arriving Soon")
                )
)


server <- function(input, output) {
  
  output$No_Plot <- renderPlot({
    
    Country <- input$Country
    Gender <- input$Gender
    Age <-input$Age
    
    
    if(Country =="China" && Gender = "Male"){
      
    }
    
    if(input$Country =="China"){
      a <- ggplot(dataset$country = "China") + geom_line(mapping = aes(x=age,y= total))
    }
    
    if(input$Country =="India"){
      a <- ggplot(dataset) + geom_line(mapping = aes(x=age,y= total))
    }
    
    
    
    if(input$Country =="Line"){
      a <- ggplot(dataset) + geom_line(mapping = aes(x=age,y= total))
    }
    
    a
  })
}




shinyApp(ui, server)
