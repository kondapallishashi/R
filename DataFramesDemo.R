#Demonstrates Data Frame in R
#A data frame is a list of vectors which are of equal length. 
#A matrix contains only one type of data, while a data frame accepts different data types (numeric, character, factor, etc.).

#Syntax
#data.frame(df, stringsAsFactors = TRUE)

# Create a, b, c, d variables
a <- c(10,20,30,40)
b <- c('book', 'pen', 'textbook', 'pencil_case')
c <- c(TRUE,FALSE,TRUE,FALSE)
d <- c(2.5, 8, 10, 7)
# Join the variables to create a data frame
df <- data.frame(a,b,c,d)
df

#We can change the column name with the function names()
# Name the data frame
names(df) <- c('ID', 'items', 'store', 'price')
df

# Print the structure
#By default, data frame returns string variables as a factor.
#items: Factor w/ 4 levels "book","pen","pencil_case",..: 1 2 4 3
"Prining the Structure of Data Frame df"
str(df)

#Slicing the Data Frame
#Dataframe consists of rows and columns and we can use this to slice.
#Syntax: Data_Frame_Name[row_number,column_number]
#Syntax: Data_Frame_Name[row_range,column_range]
#row_range & column_range is defined by specifing the limiting values separated by :

df[1,2]
df[2,]
df[,2]
df[1:3,]
df[,2:4]
df[1:3,2:4]

#Appending a column to Data Frame using the symbol $
#The number of elements should match the number of elements in Data Frame

df$quantity<-c(10,25,15,5)
df

#To Select a column in a Data Frame for further operations or storing purposes
df$ID
df$items

#Creating a subset of a data frame based on a condition
#subset(x, condition)
#  x: data frame used to perform the subset
#  condition: define the conditional statement

subset(df,subset=price>5)

#To load a data frame from another location
PATH <-'https://raw.githubusercontent.com/guru99-edu/R-Programming/master/prison.csv'
df <- read.csv(PATH)[1:5]
str(df)
head(df, 5)







