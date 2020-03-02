#Demonstrates ggplot()
#ggplot is part of tidyverse package. this must be installed prior to using ggplot.

#incase tidyverse package is not installed.
#install.packages("tidyverse")
#load()


#HISTOGRAM USING THE AIRQUALITY DATASET
ggplot(airquality,aes(x=Temp)) +
  #binwidth specifies the width of bin. ggplot, by default uses 30 bins
  #TRY: binwidth=3, remove binwidth entirely.
  #color=border of the bin, fill=color inside each bin. TRY,red blue
  geom_histogram(binwidth=5,color = "blue",fill="red") +
  #theme-bw provides a black & white theme as background
  theme_bw() +
  #provides the labelling details.
  labs(x = "Temperature (Fahrenheit)",
  y="Frequency", 
  title= "Temperatures in the airquality Data Frame")

#BAR Plot using the Cars93 dataset
#There is no need to create table(Cars93$Type) for ggplot()
library(MASS)
ggplot(Cars93,aes(x=Type)) +
  geom_bar()+
  labs(y="Frequency",title="Car Type and Frequency in Cars93")

#Grouped Bar Plot
#Create a subset of Cars93 data set containing Type and Origin
cars.type<-subset(Cars93, select=c("Type","Origin"))
head(cars.type)

#use x=Type to indicate the type of car in the x-axis
#use fill=origin as the second argument in aes() to indicate that Origin to be used to fill the bars
#There are two differences in the base R bar plot and ggplot bar plot
#1. The legend is automatically supplied in the ggplot()
#2. The bar for 0 values is displayed as is and the non zero bar is of the same length in base R bar plot.
# where as in ggplot, the bar is twice as large in case the other value is 0.
ggplot(cars.type,aes(x=Type,fill=Origin)) + 
  #position="dodge" is used to display the bars side by side similar to beside=TRUE
  geom_bar(position="dodge", color="blue") + 
  scale_color_grey(start=0,end=1)


#Grouped Bar plot
load(HairEyeColor)
females<-HairEyeColor[,,2]
females
class(females)

#The data in females is in wide format and ggplot requires the data to be in long format.
#Even though tidyr provides a function gather() to convert wide format to long format, we cannot use it on females as it is a matrix and not a data frame.
#One option is to convert females to data frame and then use it in ggplot().
#However, applying data.frame() to females will convert from wide format to long format

females.df<-data.frame(females)
females.df
#y=Freq is used for y-axis. stat="identity" is used to ensure that the given data is used without bothering about instances
ggplot(females.df, aes(x=Hair,y = Freq, fill=Eye))+
  geom_bar(position="dodge",color="black",stat="identity")+
  scale_fill_grey(start=0,end=1)

#Using LifeCycleSavings data set for generating the bar plot
LifeCycleSavings

#The intention is to generate the bar plot using the country, pop15, pop75
#Making a subset with the data of interest
lifecycle.pop15.pop75<-subset(LifeCycleSavings, select=c(pop15,pop75))
lifecycle.pop15.pop75
lifecycle.country<-rownames_to_column(lifecycle.pop15.pop75,var="Country")
lifecycle.country
#to get the top values only
lifecycle.country<-head(lifecycle.country)
long.population <- lifecycle.country%>% gather(Population,Percentage, pop15:pop75)
long.population

top.long.population<-head(long.population)


#Using ggplot() to make a bar chart
ggplot(long.population,aes(x=Country,y=Percentage, fill=Population)) +
  geom_bar(position="dodge",color="blue",stat="identity") +
  scale_fill_grey(start=0,end=1,labels=c("Under 15","Over 75"))


#Using ggplot() to make a bar chart
ggplot(top.long.population,aes(x=Country,y=Percentage, fill=Population)) +
  geom_bar(position="dodge",color="blue",stat="identity") +
  scale_fill_grey(start=0,end=1,labels=c("Under 15","Over 75"))


#SCATTER PLOTS
#Scatter plots are best for showing relation ships between two variables
ggplot(airquality, aes(x=Wind,y=Temp))+
  geom_point()

#THE BELOW EXERCISE IS TO DO A SCATTER PLOT BY CONSIDERING THE IMPACT OF OZONE
#.. TO THE RELATION SHIP OF WIND AND TEMP AND DISPLAY DIFFERENT COLORED POINTS

#This we will do as an independent exercise that is executable with in this commented space.
# Use the drop.na() function in tidyr package to remove NA values.
library(tidyr)
#Drop NA values from the airquantity dataset.
airquality.no.NA <- drop_na(airquality)

#calculate the median of the Ozon values from the sanitized data set
median.ozone <- median(airquality.no.NA$Ozone)

#Adda column Ozone level to the data frame airquality.no.NA with values low or high depending upon whether the value is above median or lower than median
ozone.level<-NULL

for(i in 1:nrow(airquality.no.NA)) {
  if(airquality.no.NA$Ozone[i] <= median.ozone) {
    ozone.level[i]<- "Low"
  } else { ozone.level[i]<- "High" }
}

ozone.level

#adding vector ozone.level to airquality.no.NA as a column using cbind()

airquality.no.NA.with.ozone <- cbind(airquality.no.NA,ozone.level)

head(airquality.no.NA.with.ozone)

#Plotting a scatter plot with ggplot()
ggplot(airquality.no.NA.with.ozone, aes(x=Wind,y=Temp,color=ozone.level)) +
  geom_point(size=3) #+
   #scale_color_grey(start=0,end=1)


#To find the relation ship between more than two variables 
#use linear model function lm()

airquality.analysis <- lm(Temp ~ Wind + Ozone,data=airquality.no.NA.with.ozone)
summary(airquality.analysis)

#To generate a 3d scatter plot, install the package scatterplot3d
#install.packages("scatterplot3d)
#Load the library
library(scatterplot3d)

#with allows the usage of columns without $ like, instead of airquality$Wind, we can use Wind.
with(airquality.no.NA.with.ozone, (scatterplot3d(Wind~Temp+Ozone,pch=19)))


#The scatterplot matrix shows relation ship between more than 2 variables in a data set.
#To generate a scatterplot matrix, use ggpairs() function provided as part of ggally package built on ggplot2.
library(ggplot2)
library(GGally)

#Make a subset of airquality.no.NA dataset.
airquality.subset<-subset(airquality.no.NA, select=c(Ozone, Wind, Temp, Solar.R ))
ggpairs(airquality.subset)



#BOX PLOTS

#To plot Temperature against month in ggplot()
#The as.factor(Month) is used to treat Month as a categorical factor instead of numerical value.
ggplot(airquality, aes(x=as.factor(Month),y=Temp)) +
  geom_boxplot() +
  geom_point()+ #This is added to display all data points
  labs(y="Temperature",x="Month")+ #This is used to change the x,y-axis labels
  scale_x_discrete(labels=c("May","June","July","August", "September")) #this is used to display month names instead of numbers 5,5,7..
