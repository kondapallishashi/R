#Demonstrates the linear model.
#Uses airquality dataset by loading the built-in dataset
airquality

#function(dependent_var ~ independent_var, data = data.frame)

#perform the linear model formula as shown below:

analysis<-lm(Temp ~ Month,data=airquality)
summary(analysis)

