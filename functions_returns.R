#Demonstrates the return statements with in a function.



#Test for Positive numbers
check.number(10)
check.number(-15)
check.number(0)


check.number<-function(number) {
  if(number>0) {
    result<-"positive"
  }
  else if(number<0) {
    result<-"Negative"
  }
  else {
    result<-"Zero"
  }
  
  #Define the return statement here. However in this function it is optional
  return(result)
  #Comment the above line and uncomment the below line to test.
  #result
  #The function always return the last statement result if explicitly not specified.
}

check.vector(c(2,4,6))
check.vector(c(1,3,5))
check.vector(c(1,2,3,4,5))


check.vector<-function(x) {
  if(x%%2==0)
  {
    return("All elements in vector are even values")
  }
  else if(x%%2==1)
  {
    return("All elements in vector are odd values")
  }
  else {
    return("Vector contains even and odd values")
  }
}
