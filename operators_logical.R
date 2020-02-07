# This program demonstrates the usage of Logical Operators in R
# The following operators are used in this program
# 
# Logical AND (Vectorized) --> &
# Logical AND (Un-Vectorized) --> &&
# Logical OR (Vectorized) --> | 
# Logical OR (Un-Vectorized) --> ||
# Logical NOT --> !

#The logical operators will result in either TRUE or FALSE. T or F can also be used in place of TRUE or FALSE respectively
#R being case sensitive does not support True, False, true, false.


#The following data types are used in this program

x<-0:2
y<-2:0
x
y

a<-c(TRUE,FALSE,0,5) # 0 is FALSE and Non-Zero number is TRUE
b<-c(TRUE,TRUE,TRUE,FALSE)
#Define a vector with 2 elements.
c<-c(FALSE,TRUE)
#Define a vector where the elements in the longer verctor are not integral multiples of the shorter vector length.
d<-c(TRUE,FALSE,TRUE)


# 0 is considered as FALSE and non zero value is considered as TRUE.


#Vectorized Logical AND & compares two vectors element wise and returns a vector of True or false
#The length of the resultant vector will be equal to the longest operand. 
#When vectors of differing lengths are used, the elements in the shorter operand are recycled.
#When the number of elements in the shorter operand are not equal to integral multiple of elements in longer operand, a warning is issued.

#0<1 & 2>1 = TRUE; 1<1 & 1>1 = FALSE; 2<1 & 0>1=FALSE
(x<1) & (y>1)
a & b
a & c
a & d


#unvectorized Logical AND && compares the first value of each vector and returns the first logical result
#0<1 && 2>1 = TRUE
(x<1) && (y>1)

#Vectorized Logical OR (|) compares two vectors element wise and returns a vector of TRUE or FALSE
# 0<1 | 2>1 = TRUE; 1<1 | 1>1 = FALSE; 2<1 | 0>1 = FALSE

(x<1) | (y>1)

#unvectorized Logical OR || compares the first value of each vector and returns the first logical result
#0<1 || 2>1 = TRUE
(x<1) || (y>1)

#Logical Negation ! either returns a single logical value or a vector of TRUE/FALSE
!y==x


