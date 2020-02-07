#Compute the mean, trimmed mean and median for the population.
#The state.csv data set is used for this program.

ratings<-c(4,3,4,2,1,4)
rating<-c(4,3,4,2,1)

#mean
#mean=sum(x1,x2,x3....xn)/n
mean(ratings)
mean(rating)

#median
#sorted ratings <- 1,2,3,4,4,4. Since there is no mid number, the median is (4+4)/2=3.5
median(ratings)
#sorted rating <- 1,2,3,4,4. The median is 3
median(rating)


#trimmed mean
#A percentage of extreme values either small or large are removed from the calculation to remove extreme variances.
#for example, if we have a 
#weighted mean
#weighted median


#read the data in the csv file into a data frame.
state<-read.csv("state.csv")
state

#Calculate the mean 
mean(state[["Population"]])

#Calculate the trimmed mean
#trim=0.1 drops 10% of the values from each end. The smallest and largest 5 states are dropped from the calculation.
mean(state[["Population"]],trim=0.1)

#Calculate the median of the population 
median(state[["Population"]])

#the R base packages do not support weighted mean and weighted median.
#install the package matrixStats for weighted mean and weighted median
#To install --> install.packages("matrixStats")

#Calculate Weighted Mean
weighted.mean(state[["Murder.Rate"]],w=state[["Population"]])

#Calculate Weighted Median
#This is throwing error. To be checked later.
weightedMedian(state[["Murder.Rate"]],w=state[["Population"]])


