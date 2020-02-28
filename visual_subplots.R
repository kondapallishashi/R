#Demonstrates the subplots
#Usage of par() function

temp<-c("Sun"=22,"Mon"=27,"Tue"=26,"Wed"=24,"Thu"=23,"Fri"=26,"Sat"=28)
temp

#To create multiple plots in a single plot set the mfrow to 1,2 indicating two plots in one row
par(mfrow=c(1,2))

#create two plots.
#Bar plot
barplot(temp,main="Bar Plot")
#Pie Chart
pie(temp,main="Pie Chart", radius = 1)

#Make par(mfrow=c(2,2)) to par(mfcol=c(2,2)) and reexecute
Temperature <- airquality$Temp
Ozone <- airquality$Ozone
par(mfrow=c(2,2))
hist(Temperature)
boxplot(Temperature, horizontal=TRUE)
hist(Ozone)
boxplot(Ozone, horizontal=TRUE)

#More precison control over the plots

# make labels and margins smaller
par(cex=0.7, mai=c(0.1,0.1,0.2,0.1))
Temperature <- airquality$Temp
# define area for the histogram
par(fig=c(0.1,0.7,0.3,0.9))
hist(Temperature)
# define area for the boxplot
par(fig=c(0.8,1,0,1), new=TRUE)
boxplot(Temperature)
# define area for the stripchart
par(fig=c(0.1,0.67,0.1,0.25), new=TRUE)
stripchart(Temperature, method="jitter")
