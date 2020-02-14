#Demonstrates the Histogram
#Use the airquantity data set 

#To display the data in airquality data set
airquality

#To understand the structure of airquality dataset
str(airquality)

Temperature<-airquality$Temp
#A Simple histogram is generated with equal number of cells and the number of observations falling in each cell value.
#The y axis in this case is frequency
hist(Temperature)

#Many parameters are supported with the Histogram
#main="Provide the Title for the Histogram"
#xlab="Label for x axis"
#ylab="Label for y axis"
#xlim=c(min:max) -- provide the range of values for xlimit
#ylim=c(min:max) -- provide the range of values for ylimit
#col="Color"
#freq=FALSE -- is used to get probability density instead of frequency representation, so that the histogram has an area of 1.
#This defaults to TRUE if and only if breaks are equidistant and probability is not specified.

# histogram with added parameters. This generates a histogram with density as y axis
hist(Temperature,
     main="Maximum daily temperature at La Guardia Airport",
     xlab="Temperature in degrees Fahrenheit",
     xlim=c(50,100),
     col="darkmagenta",
     freq=FALSE
)

#hist() function returns 6 values that can be used for further processing
h<-hist(Temperature)
h

#Add more details to the histogram
#The text() function can be used along with details returned by hist()
text(h$mids,h$counts,labels=h$counts,adj=c(0.5,-0.5))

#The number of the cells can be suggested using the breaks. R however calculates the best possible cells based on the suggestion. The recommendation may not be strictly adhered to
hist(Temperature, breaks=4,main="With breaks=4")
hist(Temperature, breaks=20,main="With breaks=20")

#Histogram with non-uniform width
#
hist(Temperature,
     main="Maximum daily temperature at La Guardia Airport",
     xlab="Temperature in degrees Fahrenheit",
     xlim=c(50,100),
     col="chocolate",
     border="brown",
     breaks=c(55,60,70,75,80,100)
)
