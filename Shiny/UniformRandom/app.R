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
#typically the UI page format is 
#ui <- type_of_page() 
#Arguments in the function determine the look and feel and functionality of the page.
#fluidPage() function has two arguments, a function that outlines the input and output

ui <- fluidPage(
    #Define the slider function
    sliderInput(
        inputId = "number", # This is the number that the user inputs by sliding the slider. This is referred in server function as input$number
        label="Select a Number", #label for the slider
        value=500, min=25,max=1000 #selected value is 500, min value is 25 and max value is 1000
        ), #End of sliderInput()
    plotOutput("hist") #At this point of time, R knows that the output name is hist, but does not know the details of the output. These are defined in the server function
)#End of fluidPage()

# Define server logic required to draw a histogram
#server <- function(input,output) {}

server <- function(input,output) {
    #renderplot({}) plots the output.
    output$hist <- renderPlot({
        #Start of histogram code
        hist(
            runif(input$number,min=0,max=1), 
            xlab="Value",
            main=paste(input$number,"random values between 0 and 1")
            ) #End of histogram code
    })#end of renderplot()
} #end of server function.


# Run the application 
shinyApp(ui = ui, server = server)
