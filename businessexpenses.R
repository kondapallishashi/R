#Demonstrates the calculation of business expenses
#Read the business expenses maintained in an expenses.csv file

expenses<-read.csv("expenses.csv",header=TRUE)
head(expenses)
#Since margin is 2, sum operation is performed on the columns
expenses_category<-apply(expenses[2:14],2,sum)
expenses_category
#mentioning 1 in margin performs sum operation on the rows of the data set
expenses_daywise<-apply(expenses[2:14],1,sum)
expenses_daywise
