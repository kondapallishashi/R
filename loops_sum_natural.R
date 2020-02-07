#The program calculates the sum of natural numbers.
#The sum of natural numbers is the sum of all numbers in sequence from 0 to the number mentioned.
#Demonstrates the if and while loops

#Method 1: Using the loops
# take input from the user
num = as.integer(readline(prompt = "Enter a number: "))
if(num < 0) {
  print("Enter a positive number")
} else {
  sum = 0
  # use while loop to iterate until zero
  while(num > 0) {
    sum = sum + num
    num = num - 1
  }
  print(paste("The sum is", sum))
}

#Method 2: Using the formula

number = as.integer(readline(prompt = "Enter a number to calculate sum of natural numbers using Formula: "))
if(number < 0) {
  print("Enter a positive number")
} else {
  sumNatural = (number * (number + 1)) / 2;
  print(paste("The sum is", sumNatural))
}