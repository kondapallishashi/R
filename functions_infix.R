#Demonstrates the functionality of infix operator



#Define a global variable
a<-5
outer.function()


#This function will also be in the global environment
#Define a function that has another function within the body of the outer function
outer.function<-function() {
  #Declare a local variable. The variable name can be same as the one defined outside the function.
    a<-10
    b<-5
    
  
  print(paste("Values of a & b in outer.function are",a,b))
  
  
  #----------MOVE THE ENCLOSED CODE TO BELOW INNER FUNCTION DEFINITION---
  #The environment details can be obtained using the function environment()
  print(environment())
  
  #The elements stored in the environment can be displayed using the ls() function
  print("The elements in the outer.function are: ")
  print(ls())
  
  inner.function(10)
  #-------------MOVE----------------------------
  
  inner.function<-function(x) {
    #Define another local variable. This is local to inner.function
    #This is different from the variable b in outer.function
    a<-2
    b<-9
    print(paste("Values of a & b in inner.function are",a,b))
    
    #To assign a value to a variable in a global environment use the 
    #<<- operator
    a<<-500
    
    #Print the details of the environment from inner function
    print("Environment in inner.function is: ")
    print(environment())
    
    #Print the elements in the inner.function environment
    print(ls())
  }
  
}

#Print the environment details outside of outer.function
print("The environment details outside outer.function is")
print(environment())

#Print the elements stored in the global environment
print(ls())

#print the updated value of a after assigning a new value from within the outer.function

a
