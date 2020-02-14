#Demonstrates boxplot() for visualization.
#airquality data set is used for data

airquality
str(airquality)

#out of the available data, lets plot for ozone readings
boxplot(airquality$Ozone)

#Make notch=FALSE and observe the difference.
#Make horizontal=FALSE and observe the difference.
boxplot(airquality$Ozone,
        main = "Mean ozone in parts per billion at Roosevelt Island",
        xlab = "Parts Per Billion",
        ylab = "Ozone",
        col = "orange",
        border = "brown",
        horizontal = TRUE,
        notch = TRUE
)

#Multiple Box Plots.
#Generate box plots for ozone, temperature, normal distribution with same mean and standard deviation for ozone and temperature
#Prepare the data
#Prepare the vector for ozone
ozone<-airquality$Ozone
#Prepare the vector for temperature
temp<-airquality$Temp
#Generate normal distribution with same mean and sd for ozone
norm_ozone<-rnorm(200,mean=mean(ozone,na.rm=TRUE),sd=sd(ozone,na.rm=TRUE))
#Generate normal distribution with same mean and sd for temperature
norm_temp<-rnorm(200,mean=mean(temp,na.rm=TRUE),sd=sd(temp,na.rm=TRUE))


boxplot(ozone, norm_ozone, temp, norm_temp,
        main = "Multiple boxplots for comparision",
        at = c(1,2,4,5),
        names = c("ozone", "normal", "temp", "normal"),
        las = 2,
        col = c("orange","red"),
        border = "brown",
        horizontal = TRUE,
        notch = TRUE
)


#Box plot grouped by month

boxplot(Temp~Month,
        data=airquality,
        main="Different boxplots for each month",
        xlab="Month Number",
        ylab="Degree Fahrenheit",
        col="orange",
        border="brown"
)