#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(ggplot2)
library(shiny)

ui <- fluidPage(
    sliderInput(inputId = "number",label="Select a number",min=0,max=1000,value=500),
    sliderInput(inputId = "binwidth",label="Select a binwidth", value=0.05, min=0.01, max=0.1),
    plotOutput("hist"),
    textOutput("mean"),
    textOutput("median"),
    textOutput("sd")
)


server <- function(input,output) {
    
    #Use this reactive data for rendering the values mean median and sd as well
    #
    histdata <- reactive({
        runif(input$number, min=0, max=1)
    })
    
    output$hist <- renderPlot({
        #Since we cannot pass the numerical values to ggplot, convert the output of runif() to data frame
        #Uncomment this when executing the program without mean, median & sd values
        #df <- data.frame(runif(input$number,min=0,max=1))
        
        #uncomment the above line and comment the below line to display non-reactive context
        df <- data.frame(histdata())
        
        #Assign a column name to the values
        colnames(df) <- c("Value")
        
        ggplot(df,aes(x=Value))+
            geom_histogram(binwidth=input$binwidth, color = "black",fill="grey80") +
            labs(y="Frequency", title = paste(input$number,"random values from 0 to 1 with binwidth =",input$binwidth))
        
    })
    
    output$mean <- renderText({paste("Mean =",round(mean(histdata()),3)
    )
    })
    output$median <- renderText({paste("Median =",round(median(histdata()),3)
    )
    })
    output$sd <- renderText({paste("Standard Deviation =",round(sd(histdata()),3)
    )
    })
}

shinyApp(ui = ui, server = server)

