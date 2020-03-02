#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Histogram of random unified distribution"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput(inputId = "number",
                        label="Select a Number:",
                        min = 0,
                        max = 1000,
                        value = 500)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("hist"),
           textOutput("mean"),
           textOutput("median"),
           textOutput("sd")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    #Prepare hist data in reactive context
    #Creating this variable provides the ability to use the results of sampling the uniform distribution for other calculations such as mean, median, standard deviation etc
    
    histdata <- reactive({
        runif(input$number, min=0,max=1)
    })
    
    

    output$hist <- renderPlot({
        # generate bins based on input$bins from ui.R
        #x    <- faithful[, 2]
        #bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        #hist(x, breaks = bins, col = 'darkgray', border = 'white')
        
       #This is the non-reactive way of displaying the histogram.
         #hist(runif(input$number,min=0,max=1),xlab="Values",main=paste(input$number, "random values between 0 and 1"))
        
        #DISPLAY THE REACTIVE VARIABLE HISTDATA
        hist(histdata(), xlab="Value",main=paste(input$number,"random values between 0 and 1"))
    })
    
    
    output$mean <- renderText({
        paste("Mean = ", round(mean(histdata()),3))
    })
    
    output$median <- renderText({
        paste("Median = ", round(median(histdata()),3))
    })
    
    output$mean <- renderText({
        paste("Standard Deviation = ", round(sd(histdata()),3))
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
