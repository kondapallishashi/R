#Demonstrates some built in functions.
#Simple functions are chosen as this program is intended to provide basic information on the functions

#Functions to calculate sum,mean and product of elements in a vector
a<-c(2,7,5,1,11,8)
sum(a)
mean(a)
prod(a)

b<-c(3,1,5,6,NA)
sum(b)
sum(b,na.rm=TRUE)
mean(b,na.rm=TRUE)
prod(b,na.rm = TRUE)



