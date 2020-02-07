#Demonstrates the if loops
a<-0
b<-5
c<-c(TRUE,FALSE)
d<-c(FALSE,TRUE)

if(a) {
  print("This statement is not executed as 0 evaluates to FALSE")
}

if(a<4) {
  print("This statement is executed as a=0 is less than 4")
}

if(b) {
  print("This statement is executed as b=5, evaluates to TRUE")
}

if(c) {
  {
    print("This statement is executed as the first element of vector c is TRUE")
  }
}

# The if..else loop
#Please note that the else must be written in the same line as the closing brace of the if statement block.
if(a) {
  print("This statement is not executed as a=0 evaluates to FALSE")
} else {
  print("The statement in else block is executed as a=0 evaluates to FALSE")
}

if(d) {
  print("This statement is not executed as the first element of vector d is FALSE")
} else {
  print("This statement is executed as the expression in if evaluates to FALSE")
}

#In case the one line statements following the if..else the {} need not be used.
if(b>0) print("b is a positive number") else print("b is a negative number")

#if else ladder
x <- 0
if (x < 0) {
  print("Negative number")
} else if (x > 0) {
  print("Positive number")
} else
  print("Zero")

#Nested if..else if loops

#ifelse() function
p<-c(2,3,5,8,9,15)
ifelse(p%%2==0,"even","odd")

q<-c(1,3,6,8,11,16)
ifelse(q%%2==0,c(25,75,125,175,225,275),c(50,100,150,200,250,300))


