#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

#This dashboard uses the shinydashboard package which, if not available is installed using install.packages("shinydashboard")
library(shinydashboard)
library(shiny)


#Define the UI component.

# use the dashboardPage() type of UI
# This has arguments such as dashboardHeader(), dashboardSidebar(), dashboardBody()
# box inside a fluidRow is used to build the interface components.

ui <- dashboardPage(
    dashboardHeader(title = "Uniform Distribution"),
    dashboardSidebar(),
    dashboardBody(
        fluidRow(
            box(
                title = "Select a number",
                background = "yellow",
                height =312,
                #This adds yellow color to the slider.
                #Other status includes success (green), info (aqua), danger (red), warning (yellow), primary (blue) are available.
                status = "warning",
                sliderInput(
                    inputId = "number",
                    label = "", # Omitting the label will throw an error
                    value = 500,
                    min = 25,
                    max = 1000
                )#End of sliderInput
            ), #End of Box
            
            box(
                title = "Histogram",
                background = "light-blue",
                #This adds blue color to the plot.
                status = "primary",
                plotOutput("hist", height = 250) #height sets the height for the graph and not the box.
            ),#End of box
            
            valueBoxOutput("meanBox"),
            valueBoxOutput("medianBox"),
            valueBoxOutput("sdBox")
            
            
        )#End of fluidRow()
       
    ) #End of dashboardBody()

)#End of ui segment

#Adding the server component

server <- function(input, output) {
    
    #Creating the histdata as a reactive component
    #input$number is the input number from the sliderInput.
    histdata <- reactive({
        runif(input$number, min = 0, max = 1)
    })
        
    #Rendering the plot    
    output$hist <- renderPlot({
        
        #Generating then histogram.
        hist(histdata(), xlab = "value", main = paste(input$number, " random values between 0 and 1"))
    })
    
    output$meanBox <- renderValueBox({
        valueBox(
            round(mean(histdata()),3), "Mean", color = "navy"
        )
    })
    
    output$medianBox <- renderValueBox({
        valueBox(
            round(median(histdata()),3), "Median", color = "aqua"
        )
    })
    
    output$sdBox <- renderValueBox({
        valueBox(
            round(sd(histdata()),3), "Standard Deviation", color ="blue"
        )
    })
    
} #End of the server function
    

#Adding the shinyApp()
shinyApp(ui = ui, server = server)

