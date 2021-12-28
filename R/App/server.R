#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    #Read File
    #setwd(dirname(rstudioapi::getSourceEditorContext()$path))
    #setwd("C:/Users/ZeBomb/Desktop/DAT301/proj/polyglot-ZeBomb-main/R/App")
    data = read.csv("data/jobs.csv")
    
    output$distPlot <- renderPlotly({
        #Filter Data
        rated <- filter(data, data$rating > input$rating)
        x <- count(rated, location)
        
        xT= as.data.frame(t(x[,2]))
        colnames(xT)<- x[,1]
        
        if(input$chandler == FALSE) {
            xT = select(xT, -'Chandler')
        }
        if(input$mesa == FALSE) {
            xT = select(xT, -'Mesa')
        }
        if(input$phoenix == FALSE) {
            xT = select(xT, -'Phoenix')
        }
        if(input$gilbert == FALSE) {
            xT = select(xT, -'Gilbert')
        }
        if(input$tempe == FALSE) {
            xT = select(xT, -'Tempe')
        }
        if(input$scottsdale == FALSE) {
            xT = select(xT, -'Scottsdale')
        }
        toPlot <- as.matrix(xT)
        
        #Plot Data
        if(length(toPlot) == 0) {
            barplot(c(0,0), main = "No Jobs match")
        } else {
            plot_ly(
                as.data.frame(toPlot),
                x = colnames(toPlot),
                y = toPlot[1,],
                type = 'bar'
            )
        }
        

    })

})
