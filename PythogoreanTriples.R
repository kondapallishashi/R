#The pythogorean triples are values a,b,c such that a^2+b^2=c^. 
#There are many ways to calculate this but one common way is:
# a=s^2 - t^2 where s,t are two positive integers and s is greater than t
# b=2*s*t
# c=s^2+t^2

#Even though readline() and readlines() can be used, these functions reads the 
#user input as strings and we will need to convert them into integers

#use scan() function to read the user inputs which are built into a vector.
#the scan reads user inputs untill the user inputs the Enter key.

#Define a function to calculate pythogorean triples
#x is a vector with s and t values.
pythogorean_triples<-function(x) {
  s<-x[1]
  t<-x[2]
  a<-s^2-t^2
  b<-2*s*t
  c<-s^2+t^2
  cat("The pythogorean triple is: ",a,b,c,"\n")
}
print("Enter the values for s and t: Value of s should be more than t")
input<-scan()

pythogorean_triples(input)

