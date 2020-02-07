#Demonstrates input and output methods

#To read a line of input from the keyboard
#The input is read as text.
#Provide inputs such as 10, pi
x<-readline("Enter the value to display")
x
class(x)
#getOption() displays the default number of digits for numerical data which is 7
getOption("digits")

# To Change the default number of digits use the options() function
options(digits=4)

# scan() reads the input untill the user presses the enter key.
y<-scan("", what="int")
y


#read.table() reads data from a table and returns a data frame.
#read.table()

#write.table()