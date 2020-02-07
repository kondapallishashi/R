#Demonstrates the functions

#Defining a basic function
#area is the name of the function and length and breadth are formal arguments
areaOfRectangle<-function(length,breadth) {
  #calculateArea is a local variable whose scope is inside the function area
  calculateArea<-length*breadth
  print(paste("The area of a rectangle with length ",length," and breadth",breadth," is",calculateArea))
}

#Calling the function with actual arguments
areaOfRectangle(5,2)

#Calling the function with Named Arguments
areaOfRectangle(length=6,breadth=3)

#While calling the function with named parameters order of arguments is not considered
areaOfRectangle(breadth=4,length = 7)

#Calling the function with Named and Unnamed arguments
areaOfRectangle(length=4,2)



  
