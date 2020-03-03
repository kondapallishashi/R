#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)

# The User Interface.

ui <- dashboardPage(
    
        #Dashboard Header
        dashboardHeader(
            title = "Uniform and Standard Distributions"
        ), #End of dashboardHeader()
        
        #Dashboard Sidebar
        dashboardSidebar(
            
            #Sidebar Menu contains the menu items, clicking upon which the corresponding tabItem in tabItems will be displayed.
            sidebarMenu(
                
                #First Menu Item
                menuItem(
                    "Uniform Distribution", # Text that appears in Side Bar Menu Text
                    tabName = "Uniform",    # Text that appears in the corresponding Tab Item.
                    icon = icon("square") # The icon() renders icons for the menu items. The icons like square, bell-o are special characters found at  http://fontawesome.io/icons.
                ), #End of first Menu Item
                
                #Second Menu Item
                menuItem(
                    "Normal Distribution",
                    tabName = "Normal",
                    icon = icon("bell-o")
                ) #End of second Menu Item
            )#End of sidebar Menu
        ), #End of dashboardSidebar()
        
        #Dashboard Body
        dashboardBody(
            
            #Tab Items corresponding to the Menu Items
            tabItems(
                #First Tab Item corresponding to Menu Item Uniform
                tabItem(
                    tabName = "Uniform",
                    
                    fluidRow(
                        #Box for slider input
                        box(
                            title = "Select a Number",
                            solidHeader = TRUE,
                            background = "yellow",
                            status = "warning",
                            height = 312, #Height is provided in pixel
                            #Slider Input
                            sliderInput(
                                inputId = "number",
                                label = "",
                                value = 500,
                                min = 25,
                                max = 1000
                                        ) #End of slider Input
                        ), #End of first box for slider
                        
                        #Second Box for histogram
                        box(
                            title = "Histogram",
                            solidHeader = TRUE,
                            background = "light-blue",
                            status = "primary",
                            plotOutput("hist", height = 250)
                        ), #End of box for defining the histogram
                        
                        #Define ValueBoxes.
                        valueBoxOutput("meanBox"),
                        valueBoxOutput("medianBox"),
                        valueBoxOutput("sdBox")
                    )#End of fluid Row
                ), #End of first Tab Item corresponding to First Menu Item Uniform
                
                #Second Tab Item corresponding to the Second Menu Item Normal
                tabItem(
                    tabName = "Normal",
                    
                    fluidRow(
                        #Box for the slider input
                        box(
                            title = "Select a Number",
                            solidHeader = TRUE,
                            collapsible = TRUE,
                            status = "warning",
                            sliderInput(
                                inputId = "normnumber",
                                label = "",
                                value = 500,
                                min = 25,
                                max = 1000
                                )#End of slider Input
                        ), #End of box for slider input
                        #Box for the density plot
                        box(
                            title = "Density Plot",
                            solidHeader = TRUE,
                            collapsible = TRUE,
                            background = "light-blue",
                            status = "primary",
                            plotOutput("density", height = 250)
                        ), #End of Box for the density plot
                        infoBoxOutput("meanInfoBox"),
                        infoBoxOutput("medianInfoBox"),
                        infoBoxOutput("sdInfoBox")
                    ) #End of Fluid Row in the second Tab Item
                )  #End of second Tab Item corresponding to Second Menu Item
                
            ) #End of Tab Items
            
        ) #End of dashboardBody()
    
) #End of dashboard Page.

# Server Function

server <- function(input, output) {
    #Preparing the data for histogram
    histdata <- reactive({
        runif(input$number, min = 0, max = 1)
    })
    
    #Preparing the data for density plot.
    densitydata <- reactive({
        rnorm(input$normnumber)
    })
    
    #Rendering the histogram plot for Uniform Distribution
    output$hist <- renderPlot({
        hist(
            histdata(),
            xlab = "Value",
            main = paste(input$number, " random values between 0 and 1")
             )
    })
    
    #Rendering the density plot for Normal Distribution
    output$density <- renderPlot({
        hist(
            densitydata(),
            xlab = "Value",
            main = paste("Standard normal distribution \n", input$normnumber, "random values"),
            probability = TRUE #Freq=FALSE or PROBABILITY=TRUE generates the density plot with density on the y axis.
        )
        #Lines function adds the lines to the density plot.
        lines(density(densitydata()))
    })
    
    #Rendering the ValueBox elements
    
    output$meanBox <- renderValueBox({
        valueBox(
            round(mean(histdata()),3),"Mean",
            color = "navy"
        )
    })
    output$medianBox <- renderValueBox({
        valueBox(
            round(median(histdata()),3),"Median",
            color = "aqua"
        )
    })
    output$sdBox <- renderValueBox({
        valueBox(
            round(sd(histdata()),3), "Standard Deviation",
            color = "blue"
        )
    })
    
    
    #Rendering the info Boxes.
    
    output$meanInfoBox <- renderInfoBox({
        infoBox("Mean",
                round( mean(densitydata()),3),
                icon=icon("align-center"),
                color = "navy")
    })
    output$medianInfoBox <- renderInfoBox({
        infoBox(icon=icon("area-chart"), "Median",
                round(median(densitydata()),3),
                color = "aqua")
    })
    output$sdInfoBox <- renderInfoBox({
        infoBox("Standard Deviation",
                round(sd(densitydata()),3),icon=icon("scribd"),
                fill = TRUE,
                color = "blue")
    })
    
} #End of server Function.

shinyApp(ui, server)