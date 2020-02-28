#Data Frame from Percapita Csv

percapita<-read.csv("Percapita.csv",header=TRUE)
class(percapita)
#use head to show the first 6 rows of the data frame
head(percapita)

#use tail() to show the last 6 rows of the data frame
tail(percapita)
percapita

#To select only a few of the columns mention the column names as below
pre2kdata<-subset(percapita,select=c(X1980,X1990,X1995))
pre2kdata


summary(percapita[2:9])
#use the function colMeans() to calculate the mean of the numeric values in vectors and data frames
colMeans(percapita[2:5])

quakes<-read.csv("quakes.csv",header=TRUE)
head(quakes)

summary(quakes)

colMeans(quakes[5])
summary(quakes[2:6])

#APPLY FAMILY OF FUNCTIONS
#This section demonstrates the use of lapply, sapply, tapply, apply functions.
#Read a csv file
percapita1<-read.csv("percapita1.csv",header=TRUE)
head(percapita1)

#colMeans(percapita1[2:9])

#the use of median function as shown below on the data set generates an error that this requires numeric data.
#Error in median.default(percapita1[2:9]) : need numeric data
#median(percapita1[2:9])#UNCOMMENT THIS LINE TO SEE THE ERROR ABOVE

#The lapply() function is used to find the median of each column.
lapply(percapita1[2:9],median)



