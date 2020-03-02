#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
#The Airquality dataset comes with built-in datasets package
library(datasets)
library(shiny)
#To clean the data set, use drop_na() from tidyr package.
library(tidyr)

library(tibble)

aq.no.missing <- drop_na(airquality)

#Define the options for x-variable menu and y-variable menu
Options <- c("Ozone (parts per billion" = "Ozone",
             "Solar (Langleys)"="Solar.R",
             "Wind (MPH)"="Wind",
             "Temperature (F)"="Temp")
#Convert the Options vector into a data frame.
df.options <- data.frame(Options)

df.lv <-rownames_to_column(df.options)

colnames(df.lv) <- c("label","value")



# Define UI for application that draws a histogram

ui <- fluidPage(
    selectInput("X", "X Variable: ", Options),
    selectInput("Y", "Y Variable: ", Options),
    plotOutput("scatter")
)

# Define server logic required to draw a histogram

server <- function(input, output) {
    selections <- reactive({
        #The comma indicates all the rows in the data frame
        #The next selection is the actual variables. selections() [,1], selections()[,2] etc
        aq.no.missing[,c(input$X,input$Y)]
    })
    
    #Define the output function for scatter plot.
    output$scatter <- renderPlot({
        #Get the selected values from the Options in selections()
        x_column <- selections()[,1]
        y_column <- selections()[,2]
        
        #The Correlation coefficient is calculated below.
        correlation <- cor(x_column,y_column)
        
        #Regression
        regression <- lm(y_column ~ x_column)
        
        intercept <- regression$coefficients[1]
        
        slope <- regression$coefficients[2]
        
        X_Label <- df.lv$label[which(df.lv$value == input$X)]
        Y_Label <- df.lv$label[which(df.lv$value == input$Y)]
        
        
        plot(x=x_column,y=y_column,xlab = X_Label,ylab = Y_Label,
             cex.axis = 1.5,cex.lab = 1.5, pch = 20, cex = 2,
             main = paste(Y_Label,"vs",X_Label,
                          "\n r =",round(correlation,3),"
 Y' =",round(intercept,3),"+",round(slope,3),"X"),
             cex.main=1.8)
        
        abline(intercept,slope)
        
        
    })

        
}


# Run the application 
shinyApp(ui = ui, server = server)
