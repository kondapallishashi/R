#Demonstrates some common operations using airquality dataset

library(datasets)
library(tidyr)
airquality

#Remove the values with NA
airquality.no.NA <- drop_na(airquality)
airquality.no.NA

#To determine the relationship between two variables in a dataset we can use the below formula
#function(dependent_var ~ independent_var, data = data.frame)

#lm is the function for linear model
analysis <- lm(Temp ~ Month, data=airquality)

summary(analysis)

#Box plot using the airquality
#The argument xaxt="n" suppresses the x-axis labels that would normally appear in the format 5,6,7 etc
boxplot(Temp ~ Month, data=airquality, xaxt = "n")
#Instead axis() can be used to define custom x-axis labels
axis(1, at=1:5,labels=c("May","June","July","August", "September"))


