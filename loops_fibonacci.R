#Demonstrates if and while loops
#Prints the fibonacci series
#One way of Running the program interactively is to use the Source("program_name.R") from the command prompt


# 
numberOfElements = as.integer(readline(prompt="How many elements? "))
# first two terms
element1 = 0
element2 = 1
count = 2
# check if the number of terms is valid
if(numberOfElements <= 0) {
  print("Please enter a positive integer")
} else {
  if(numberOfElements == 1) {
    print("Fibonacci sequence:")
    print(element1)
  } else {
    print("Fibonacci sequence:")
    print(element1)
    print(element2)
    while(count < numberOfElements) {
      nthElement = element1 + element2
      print(nthElement)
      # update values
      element1 = element2
      element2 = nthElement
      count = count + 1
    }
  }
}