# Program make a simple calculator that can add, subtract, multiply and divide using functions

#Define function to add two numbers
add <- function(x, y) {
  return(x + y)
}

#Define a function to subtract two numbers
subtract <- function(x, y) {
  return(x - y)
}

#Define a function to multiply two numbers
multiply <- function(x, y) {
  return(x * y)
}

#Define a function to divide two numbers
divide <- function(x, y) {
  return(x / y)
}


# take input from the user
print("Select operation.")
print("1.Add")
print("2.Subtract")
print("3.Multiply")
print("4.Divide")

#Read the user input and convert it to an integer.
choice = as.integer(readline(prompt="Enter choice[1/2/3/4]: "))

#Read the user input for first number and convert it to an integer
num1 = as.integer(readline(prompt="Enter first number: "))

#Read the user input for second number and convert it to an integer
num2 = as.integer(readline(prompt="Enter second number: "))

#The operator values will be + for 1, - for 2, * for 3, / for 4
operator <- switch(choice,"+","-","*","/")

#The choice will call add if its 1, subtract if its 2, multiply if its 3, divide if its 4
result <- switch(choice, add(num1, num2), subtract(num1, num2), multiply(num1, num2), divide(num1, num2))

#Result and operators are published
print(paste(num1, operator, num2, "=", result))