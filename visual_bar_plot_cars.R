#Demonstrates the concept of bar plots.
#Uses cars93 dataset from MASS package
#Cars93 is a dataframe from MASS dataset that contains info on 93 cars from 1993 and has 27 columns.

library(MASS)
#To see the structure of cars93 dataset.
str(Cars93)

#to see first 3 columns from first 6 rows.
head(Cars93[1:3])

#To create the barplot for the type of cars in the dataset.
#Find the frequency of the car types.
barplot(table(Cars93$Type))

#To set the type count use ylim=c(min,max). Current limit is 20, extend it to 25
#Add xlab="Type",ylab="Frequency" to add more details to the plot
#To add solid x axis, use axis.lty="solid"
#To increase the spacing between the bars use space=0.5
barplot(table(Cars93$Type), 
        ylim=c(0,25),
        xlab="Type",
        ylab="Frequency",
        axis.lty="solid",
        space=0.5
        )

#Use filter to get data for US origin models
library(dplyr)

US.Cars93<-filter(Cars93,Origin=="USA")
barplot(table(US.Cars93$Type))

#To create bar plot for cylinders.
barplot(table(Cars93$Cylinders),ylim=c(1,50),xlab="Cylinders",ylab="Frequency")




