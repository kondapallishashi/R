#Demonstrates the S3 Classes (Old Style Classes) - For all new projects use S4 type classes

#First create a list with the data that is required
#The elements of the list are members of the class
info<-list("name"="Ray", "gender"="male","age"=52,"salary"=38500)

#Set the class attribute using the class() or attr() functions

class(info)<-"member"
attributes(info)

info

#We can create custom functions.
print.member<-function(person) {
  cat("name: ",person$name,"\n")
  cat("gender: ",person$gender,"\n")
  cat("age: ",person$age,"\n")
  cat("salary: ",person$salary,"\n")
}

info
