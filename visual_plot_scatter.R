#Demonstrates Scatter Plots
#Uses airquality dataset

#Scatter plots are used to demonstrate relation ship between two variables.
#In this case the relation ship between Wind and temperature in airquality dataset

plot(airquality$Wind,
     airquality$Temp, 
     pch=5,       #pch is the plot character which takes values 0-20. if not specified it will be o.
     col="blue",
     xlab = "Wind Velocity (MPH)",
     ylab ="Temperature (Fahrenheit)", 
     main = "Temperature vs Wind Velocity"
     )

#To use formula to var1~var2 and plot the graph

plot(airquality$Temp ~ airquality$Wind, 
pch=16,
xlab = "Wind Velocity (MPH)",
ylab ="Temperature (Fahrenheit)", 
main = "Temperature vs Wind Velocity"
)

#Scatter plot matrix
#Scatter plot matrix is used to depict the relation ship between more than two variables.
#The variables are shown in a diagnal format representing the x-axis and y-axis.

#To plot the relation ship between ozone, wind and temperature in airquality dataset
#prepare the subset containing only these values.
ozone.temp.wind<-subset(airquality,select=c(Ozone,Temp,Wind))
head(ozone.temp.wind)
#pairs() function is used to draw the matrix.
pairs(ozone.temp.wind)

