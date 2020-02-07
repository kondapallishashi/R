#R supports data sets with missing values. The Missing values are often represented with NA
#Consider the vector with missing values
vector1<-c(2,4,6,8,NA,12,14)
#The mean value is displayed as NA as it cannot calculate with missing data
mean(vector1)
#by including na.rm=TRUE, the unavailable data is ignored and mean is calculated.
mean(vector1,na.rm=TRUE)
