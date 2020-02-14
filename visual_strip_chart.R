#Demonstrates Strip Chart
#Uses airquality dataset

airquality
#Display the structure of airquality dataset
str(airquality)

#Prepare a vector for Ozone representation
ozone<-airquality$Ozone

stripchart(ozone)
#or
stripchart(airquality$Ozone)

#Additional parameters can be added to the stripchart() to provide more details
#main="Title of the chart"
#xlab="Label for x axis"
#ylab="label for y axis"
#method="jitter" or "stacked" to specify the way the coincident points are plotted
#col="color"
#vertical=TRUE -- to plot vertically
#pch=0 -- pch is plotting character which is square ..0 by default. Other pch characters are circle=1,triangle=2. for full list ?points

#Make method="stacked"
#Make pch=0,1,2
#add vertical=TRUE
stripchart(airquality$Ozone,
           main="Mean ozone in parts per billion at Roosevelt Island",
           xlab="Parts Per Billion",
           ylab="Ozone",
           method="jitter",
           col="orange",
           pch=2,
           vertical=FALSE
)

#Multiple strip charts in a single plot by passing list of numeric vectors as parameter

# prepare the data
temp <- airquality$Temp
# gererate normal distribution with same mean and sd
tempNorm <- rnorm(200,mean=mean(temp, na.rm=TRUE), sd = sd(temp, na.rm=TRUE))
# make a list
x <- list("temp"=temp, "norm"=tempNorm)

stripchart(x,
           main="Multiple stripchart for comparision",
           xlab="Degree Fahrenheit",
           ylab="Temperature",
           method="jitter",
           col=c("orange","red"),
           pch=16
)

#Strip chart with formula
stripchart(Temp~Month,
           data=airquality,
           main="Different strip chart for each month",
           xlab="Months",
           ylab="Temperature",
           col="brown3",
           group.names=c("May","June","July","August","September"),
           vertical=TRUE,
           pch=16
)
