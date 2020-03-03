#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# This application outputs the ggplot for multiple selections of data columns in airquality dataset.
# The dataset airquality is part of datasets package, therefore importing the package datasets.

library(datasets)
# To use the drop_na() function to remove NA values from the data set, import tidyr package.
library(tidyr)
#
library(tibble)
#Library required for ggplot2.
library(ggplot2)
#
library(shiny)

#Preparing the data.

#Remove the NA values from the data set.
airquality.no.na <- drop_na(airquality)

# Ozone, Solar.R, Wind and Temp are the datacolumn names in airquality Dataset
# Provide a user friendly name to these column names to be displayed in dropdown list.
# Langley is a measure of solar radiation and is defined as the one small calorie per one square centimeter of irradiated area.
# One small calorie is the energy required to raise one gram of water by 1 celsius
options <- c("Ozone (parts per billion" = "Ozone", 
             "Solar (langleys" = "Solar.R",
             "Wind (mph)" = "Wind",
             "Temperature (F)" = "Temp")

#Construct a dataframe from options.
df.options <- data.frame(options)
df.options

#Convert Rows to columns in the data frame.
df.lv <- rownames_to_column(df.options)
df.lv

#Add column nammes label and value to the data frame.
colnames(df.lv) <- c("label", "value")


# Define UI for application that draws a ggplot.
ui <- fluidPage(
    
    #In the selectInput, the first one argument 'X' is the name, the second argument 'X Variable' is the label and the values are elements of vector options.
    selectInput("X", "X Variable", options),
    #In the selectInput, the first one argument 'Y' is the name, the second argument 'Y Variable' is the label and the values are elements of vector options.
    selectInput("Y", "Y Variable", options),
    # Show a plot of the generated distribution
    plotOutput("scatter")
    
    
) #End of UI Segment


# Define server logic required to draw a histogram
server <- function(input, output) {
    
    #Identify the user selection and get the selected row data.
    #Create a reactive component that gets the selected data.
    # reactive({}) components are created as shown
    
    selections <- reactive({
        # the first element, gets all the rows, and the vector c(input$X, input$Y) will get the selected columns.
        airquality.no.na[, c(input$X, input$Y)]
    })
    
    #selections, being a reactive elements needs to be referred as selections(). 
    # selections() [,1] will get all the rows from the selected column represented by 1.
    
    
    #Starting the output function.
    #renderplot({}) is a reactive component as it needs to update based on the user selections.
    output$scatter <- renderPlot({
        
        #Since we will be plotting the data from the user selected columns displayed in dropdownlists
        #prepare the x and y columns.
        x_column <- selections()[,1]
        #prepare the y column.
        y_column <- selections()[,2]
        
        #The correlation coefficient is
        correlation <- cor(x_column,y_column)
        
        #The regression analysis is generated as shown below.
        # the output of regression analysis is a list.
        # Coefficients:
        #    Estimate Std. Error t value Pr(>|t|)
        # (Intercept) 91.0305 2.3489 38.754 < 2e-16 ***
        #    Wind -1.3318 0.2226 -5.983 2.84e-08 ***
        regression <- lm(x_column ~ y_column)
        
        #To retirve the intercept from the regression analysis list.
        intercept <- regression$coefficients[1]
        
        #To retirve the slope from regression analysis.
        slope <- regression$coefficients[2]
        
        #To get the label values of the selected values from the dropdown list,
        # we need to retrieve the labels corresponding to the user selection.
        
        #which function is used to retrive the label which corresponds to the user selection input$X
        X_Label <- df.lv$label[which(df.lv$value==input$X)]
        
        #which function is used to retrive the label which corresponds to the user selection input$Y
        Y_Label <- df.lv$label[which(df.lv$value == input$Y)]
        
        
        #Rendering the ggplot.
        #the first argument selections() is the data.
        # In the aes() the first argument is data for x-axis and the second argument is for y-axis.
        ggplot(selections(), aes(x = x_column, y = y_column)) +
            # geom_point() to select points for the plot. size indicates the dimensions for the points.
            geom_point(size = 3) + 
            #adding labels using the labs() 
            labs(
                x = X_Label,
                y = Y_Label,
                title = paste(Y_Label, " vs ", X_Label, "\n r = ", round(correlation,3), " Y = ", round(intercept,3), " + ", round(slope,3))
            ) +
            
            #Adding theme() to set the sizes and fonts
            theme(axis.title.x = element_text(size=18),
                  axis.text.x = element_text(size=17),
                  axis.title.y = element_text(size=18),
                  axis.text.y = element_text(size=17),
                  plot.title = element_text(hjust = 0.5,size=20))+
            #geom_smooth() renders the regression line.
            # The first argument specifies that the method is linear regression
            # The second argument specified the color of the line.
            # The shadow around the regression line represents the standard error
            # of estimate — a measure of variability around the line. The tighter the shadow, the
            # better the fit of the line to the data. (Note what happens when the x-variable and
            # the y-variable are the same.). To eliminate the shadow, add se=FALSE as an argument to geom_smooth().
            
            geom_smooth(method="lm",col="blue")

    })
    
}


# Run the application 
shinyApp(ui = ui, server = server)
