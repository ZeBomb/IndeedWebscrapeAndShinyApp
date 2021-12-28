#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(shiny)
library(dplyr)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Data Science Jobs From Indeed"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("rating",
                        "Rating Minimum: ",
                        min = 1,
                        max = 5,
                        value = 1),
            
            checkboxInput("chandler", 
                          "Chandler",
                          TRUE),
            checkboxInput("gilbert", 
                          "Gilbert",
                          TRUE),
            checkboxInput("mesa", 
                          "Mesa",
                          TRUE),
            checkboxInput("phoenix", 
                          "Phoenix",
                          TRUE),
            checkboxInput("tempe", 
                          "Tempe",
                          TRUE),
            checkboxInput("scottsdale", 
                          "Scottsdale",
                          TRUE)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotlyOutput("distPlot")
        )
    )
))
