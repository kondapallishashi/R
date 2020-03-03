#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

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
#Install and loan moments package for skewness and kurtosis.
library(moments)



#Define the UI component.

# use the dashboardPage() type of UI
# This has arguments such as dashboardHeader(), dashboardSidebar(), dashboardBody()
# box inside a fluidRow is used to build the interface components.
#In the column layout, in the second column build the tabbed ui
# mean and median valueBoxOutputs are displayed in separate tabs in a tabbox central tendency
# The standard deviation is displayed in another tab variability.

#The value boxes are displayed as text, hence using textOutput in UI and renderText() in server.


ui <- dashboardPage(
    dashboardHeader(title = "Uniform Distribution"),
    dashboardSidebar(),
    dashboardBody(
        fluidRow(
            column( width = 6,
                    
                    box(
                        title = "Select a number",
                        background = "yellow",
                        height =312,
                        width = NULL,
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
                        width = NULL,
                        #This adds blue color to the plot.
                        status = "primary",
                        plotOutput("hist", height = 250) #height sets the height for the graph and not the box.
                    )#End of box
                    
            ), #End of column
            
            column( width = 6,
                    #valueBoxOutput("meanBox" ,width = NULL),
                    #valueBoxOutput("medianBox", width = NULL),
                    #valueBoxOutput("sdBox", width = NULL)        
                    tabBox (
                        title = "Central Tendencies",
                        id = "tabs1",
                        height = 150,
                        width = NULL,
                        tabPanel(
                            "Mean", 
                            h2(textOutput("meantext")),
                            width = NULL,
                        ), #End of Tabpanel 1
                        tabPanel(
                            "Median",
                            h2(textOutput("mediantext")),
                            width=NULL
                        ) #End of Tab Panel 2
                    ),
                    tabBox(
                        title = "Variability",
                        id="tabs2",
                        height = 150,
                        width = NULL,
                        side = "right",
                        tabPanel(
                            "Variance",
                            h2(textOutput("vartext")),
                            width = NULL
                                ), #End of tab panel variance
                        tabPanel(
                            "Standard Deviation",
                            h2(textOutput("sdtext")),
                            width = NULL
                        ) #End of tab panel SD
                    ), #End of tabBox Variance
                    tabBox(
                        title = "Appearance",
                        id="tabs3",
                        height = 150,
                        width = NULL,
                        side = "right",
                        tabPanel(
                            "Skewness",
                            h2(textOutput("skewnesstext")),
                            width = NULL
                        ), # End of tab Panel Skewness
                        tabPanel(
                          "Kurtosis",
                          h2(textOutput("kurtosistext")),
                          width = NULL
                        ) #End of Tab panel Kurtosis
                
                    ),#End of tab Box Appearance.
                    
                    #Adding three more tab boxes, 2 tab panels each and adding value Boxes to it.
                    #Tab Box for Central Tendencies
                    tabBox(
                        title = "Central Tendencies with Value Box",
                        id = "tabs 4",
                        height = 150,
                        width = NULL,
                        #Tab Panel for Mean
                        tabPanel(
                            "Mean",
                            valueBoxOutput("meanbox", width = NULL),
                            width = NULL
                        ),# End of tab Panel for Mean
                        #Tab Panel for Median
                        tabPanel(
                            "Median",
                            width = NULL,
                            valueBoxOutput("medianbox", width = NULL)
                        )#End of Tab Panel for Median
                        
                    ), # End of Tab Box Central Tendencies Value Box
                    
                    #Tab Box for Variability
                    tabBox(
                        title = "Variance with Value Box",
                        id = "tabs 5",
                        height = 150,
                        width = NULL,
                        
                        tabPanel(
                            "Variance",
                            Width = NULL,
                            valueBoxOutput("variancebox", width = NULL)
                        ), 
                        
                        tabPanel(
                            "Std Deviation",
                            width = NULL,
                            valueBoxOutput("sdbox", width = NULL)
                        )
                    ), # End of Tab Box Variability with Value Boxes
                    
                    # Tab Box for Appearance
                    tabBox(
                        title = "Appearance with Value Box",
                        id = "tabs 6",
                        height = 150,
                        width = NULL,
                        tabPanel(
                            "Skewness",
                            width = NULL,
                            valueBoxOutput("skewnessbox", width = NULL)
                        ),
                        tabPanel(
                            "Kurtosis",
                            width = NULL,
                            valueBoxOutput("kurtosisbox", width = NULL)
                        )
                        
                    ) # End of Tab Box Appearance with Value Boxes.
                    
            ) #End of second Column
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
    
    #Render the Tab text.
    output$meantext <- renderText({
        paste("Mean = ", round(mean(histdata()),3) )
    })
    
    #Render the Tab text.
    output$mediantext <- renderText({
        paste("Median = ", round(median(histdata()),3) )
    })
    
    #Render the Tab text.
    output$vartext <- renderText({
        paste("Variance = ", round(var(histdata()),3) )
    })
    
    #Render the Tab text.
    output$sdtext <- renderText({
        paste("Standard Deviation = ", round(sd(histdata()),3) )
    })
    
    #Render the Tab text.
    output$skewnesstext <- renderText({
        paste("Skewness = ", round(skewness(histdata()),3) )
    })
    
    #Render the Tab text.
    output$kurtosistext <- renderText({
        paste("Kurtosis = ", round(kurtosis(histdata()),3) )
    })
    
    
    #Rendering the value Boxes.
    
    output$meanbox <- renderValueBox({
        valueBox(
            round(mean(histdata()),3), "Mean", color = "navy"
        )
    })
    
    output$medianbox <- renderValueBox({
        valueBox(
            round(median(histdata()),3), "Median", color = "aqua"
        )
    })
    
    
    output$variancebox <- renderValueBox({
        valueBox(
            round(var(histdata()),3), "Variance", color ="green"
        )
    })
    
    
    output$sdbox <- renderValueBox({
        valueBox(
            round(sd(histdata()),3), "Standard Deviation", color ="yellow"
        )
    })
    
    output$skewnessbox <- renderValueBox({
        valueBox(
            round(sd(histdata()),3), "Skewness", color ="red"
        )
    })
    
    output$kurtosisbox <- renderValueBox({
        valueBox(
            round(kurtosis(histdata()),3), "Kurtosis", color ="orange"
        )
    })
    
    
} #End of the server function


#Adding the shinyApp()
shinyApp(ui = ui, server = server)

