#Demonstrates the estimation of variability
#Deviation
#Variance
#Standard Deviation
#Mean Absolute Deviation
#Median Absolute Deviation from the Median
#Range
#Order Statistics
#Percentile
#Interquartile Range

#Mean absolute deviation
ratings<-c(1,4,2,5,3,3)
#To Calculate mean absolute deviation.
# 1. calculate the mean. (1+4+2+5+3+3/6)=3
# 2. Calculate the deviation of each element from the mean
#    (-2,1,-1,2,0,0)
# 3. If we consider negatives, they will offset positive values, so we take the absolute values
#    (2+1+1+2+0+0)/6=1
# 4. Mean absolute deviation is 1.

#COULD NOT FIND THE FUNCTION FOR MEAN ABSOLUTE DEVIATION
#meanAD(ratings,FUN=mean)

#Median absolute deviation
#The variance, standard deviation & the mean absolute deviation are not
#robust to the outliers/extremes as they are based on the squared values of the extreme values and therefore are highly sensitive to them
# The median absolute deviation from the median is very robust estimate of variability.
#MAD=Median(x1-m,x2-m,x3-m...xn-m) where m is the median of the population.
# Calculate median of the list
median(ratings) #the median of ratings ratings<-c(1,4,2,5,3,3) is 3.5

#to calculate MAD, substract median from each of the values
#(-2.5,0.5,-1.5,1.5,-0.5,-0.5)
#Take the absolute values (2.5,0.5,1.5,1.5,0.5,0.5)
#Median of this list (0.5,0.5,0.5,1.5,1.5,2.5)


mad(rating)


#Variance
#Variance is the average of squared deviations.
#The deviations in ratings is (-2,1,-1,2,0,0) and the absolute values are (2,1,1,2,0,0)
#The formula for variance is Sum((x1-mean_x)^2+(x2-mean_x)^2+...)/n-1
# variance = sum(4+1+1+4+0+0)/5. The variance is 2





#Standard deviation is square root of variance
#sd=sqrt(2)
sd(ratings)

