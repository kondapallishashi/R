#Demonstrates some built in functions.
#Simple functions are chosen as this program is intended to provide basic information on the functions

#Absolute values of the sequence -4 to 3 ignores the signs and provides the absolute values
abs(-4:3) #Outputs: [1] 4 3 2 1 0 1 2 3

#sign() can be used to identify if a number has negative or postive sign
sign(-4:3) # Outputs: [1] -1 -1 -1 -1  0  1  1  1

round(7/18,2)

floor(0.39)

ceiling(0.39)

#signif

#trunc

#SUMMARY FUNCTIONS
#The Summary functions include all, any, sum, prod, min, max, and range
#Functions to calculate sum,mean and product of elements in a vector
a<-c(2,7,5,1,11,8)
#Sum of all elements in the vector a
sum(a)
#product of all elements in the vector a
prod(a)
#Minimum value of all the elements in the vector a
min(a)
#Maximum value of all the elements in the vector a
max(a)
#Provides the range that all the elements fall with in. Provides the min and max values
range(a)

#any() checks if the elements of the vector satisfy a specific character and outputs the logical result
any(a<0) #outputs FALSE
any(a<4) #Outputs: TRUE

#Which checks each element against a condition and outputs the index of elements satisfying the condition
which(a>4) #Prints the index of elements satisfying the condition

all(a<4)
all(a>0)



mean(a)

b<-c(3,1,5,6,NA)
sum(b)
sum(b,na.rm=TRUE)
mean(b,na.rm=TRUE)
prod(b,na.rm = TRUE)



