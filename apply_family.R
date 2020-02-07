#Demonstrates the apply family of functions
#The following functions are covered in this program.
#apply()
#lapply()
#sapply()
#tapply()

#The following data types are used in this program.
#Matrix

#APPLY FUNCTION ON MATRIX.
matrix_1<-matrix(c(1,0,3,4,6,5,10,7,9,8,2,12),nrow=4,ncol=3,byrow=TRUE)
matrix_1

sum_column<-apply(matrix_1,2,sum)
sum_column
class(sum_column)
typeof(sum_column)
mode(sum_column)

sum_row<-apply(matrix_1,1,sum)
sum_row

# Operation on both row and column not working. Need to check.
sum_row_col<-apply(matrix_1,c(1,2),sum)
sum_row_col

mean_row<-apply(matrix_1,1,mean)
mean_row

mean_column<-apply(matrix_1,2,mean)
mean_column

median_row<-apply(matrix_1,1,median)
median_row

median_col<-apply(matrix_1,2,median)
median_col

min_row<-apply(matrix_1,1,min)
min_row

min_col<-apply(matrix_1,2,min)
min_col

max_row<-apply(matrix_1,1,max)
max_row


#Demonstrates the lapply() function

cart<-c("LETTUCE","TOMATOES","CHEESE","BUTTER","WATER MELON","PINEAPPLE")
class(cart)
cart_lower<-lapply(cart,tolower)
cart_lower
class(cart_lower)

cart_matrix<-matrix(cart)
cart_lower1<-lapply(cart_matrix,tolower)
cart_lower1
class(cart_lower1)

#The unlist() function is used to convert list to a vector

cart_lower<-unlist(lapply(cart,tolower))
cart_lower1<-unlist(lapply(cart_matrix,tolower))



#mtcars<-read.csv("mtcars.csv", header=TRUE)
#head(mtcars)
#colMeans(mtcars[2:10])

#Demonstrate sapply() function
#Load the pre-defined data set mtcars

cars_data<-cars
cars_data
lapply_cars<-lapply(cars_data,min)
lapply_cars
class(lapply_cars)

sapply_cars<-sapply(cars_data,min)
sapply_cars
class(sapply_cars)

#We can also use lapply and sapply on user defined functions.

#Define a user defined function avg.
avg<-function(x) {
  (min(x) + max(x))/2
}

sapply_cars1<-sapply(cars_data,avg)
sapply_cars1

#Slicing a vector.
#Defining a user defined function that takes a vector and returns a vector with values strictly above average.
below_ave <- function(x) {  
  #calculate the mean of x
  ave <- mean(x) 
  #return the vector with values that are greater than ave
  return(x[x > ave])
}


cars_s<- sapply(cars_data, below_ave)
cars_l<- lapply(cars_data, below_ave)
#compare two vectors with identical() function.
identical(cars_s, cars_l)

#tapply()

data(iris)
tapply(iris$Sepal.Width, iris$Species, median)

