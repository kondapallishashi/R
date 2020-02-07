#Demonstrates the sample function

#Define a vector
a<-c(3,11,15,19,16,14,8,2,13,4,9,6)

#To sample 4 elements from vector a use the below function.
#Execute this method multiple times to see different results

sample(a,4)
sample(a,4,replace=TRUE)

#replace=TRUE is used when we want to build a sample bigger than the population
b<-c(2,4,6)
sample(b)
#The below statement throws an error as the size of population is 3 and we want to build a sample with size 10.
#sample(b,10) #Uncomment to execute
sample(b,10,replace=TRUE)


#if the size is not mentioned, the size defaults to the length of the vector without replacement.
#This is often used to scramble the vector.
sample(a)
#By default when only size is provide, the sampling is done from 1:n without replacement.
#To specify that replacement is required, use replace=TRUE
sample(a, replace = TRUE)

#one use case of sample. Simulate coin toss
#Remove the replace=TRUE and observe the error.
sample(c("H","T"),10,replace=TRUE)

