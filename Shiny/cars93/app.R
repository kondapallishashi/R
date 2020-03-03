# This program creates the plot for cars 93 and provides users a dropdown list to select the x-axis and y-axis 

#Importing the libraries.

library(datasets) # cars93 data set is part of MASS package in datasets
library(tidyr)    # the tidyr package is imported so that drop_na can be used to remove NA values.

#Preparing the dropdown list options for X- Axis
selector.x <- c("Car Maker" = "Manufacturer",
                "Car Type" = "Type",
                "No Of Cylinders" = "Cylinders",
                "Engine Size (litres)" = "EngineSize",
                "Horse Power (BHP)" = "Horsepower")

#Preparing the dropdown list options for y axis
selector.y <- c("Mileage in City" = "MPG.city",
                "Mileage on Highway" = "MPG.highway")


#Construct data frames from the options vectors.
df.selector.x <- data.frame(selector.x)
df.selector.y <- data.frame(selector.y)

# convert the rownames to columns
df.selector.x.lv <- rownames_to_column(df.selector.x)
df.selector.y.lv <- rownames_to_column(df.selector.y)

#Adding label and value column names to the data frames
colnames(df.selector.x.lv) <- c("label", "value")
colnames(df.selector.y.lv) <- c("label", "value")


ui <- fluidPage(
  
  #Create the dropdown list in the UI page.
  selectInput("X", "X Variable", selector.x),
  
  #Create the second dropdown list in the UI Page.
  selectInput("Y", "Y Variable", selector.y),
  
  #Outline the output function.
  plotOutput("scatter")
)

server <- function(input, output) {
  
  #Define a reactive element to capture the user selected values.
  selection <- reactive({
    Cars93[,c(input$X,input$Y)]
  })
  
  output$scatter <- renderPlot({
    x_column <- selection()[,1]
    y_column <- selection()[,2]
    
    plot(x=x_column, 
         y=y_column,
         xlab = df.selector.x.lv$label[which(df.selector.x.lv$value==input$X)],
         ylab = df.selector.y.lv$label[which(df.selector.y.lv$value==input$Y)]
         )
    
  })
  
}#End of server function.

shinyApp(ui = ui, server = server)

