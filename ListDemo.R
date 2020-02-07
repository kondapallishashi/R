#Demonstrates List in R
#List is a collection of objects such as numeric data (integer, double), character, logical, vectors, Matrices, Data Frames or even lists in the order expected.
#list() function is used to create lists with as many R objects required, each separated by commas
#list(object_1,Object_2,....)

#Create a list with different data types. In this we will use Integer, double, character, logical
#The tags ID, Item, Price are optional
shopping_list<-list("ID"=1,"Item"="Books","Price"=3.5, "In Stock"=TRUE)
shopping_list

#Create a list without tags
#Create a list with numeric, character, logical and vector type of objects
another_list<-list(2,"pencils",3.145,TRUE,1:5)
another_list
#names can be given to the elements in the lists after defining them as well.
names(another_list)<-c("ID","Item","Price","In Stock","Rating")
#Displays list with the labels.
another_list


#str() is used to display the lists with information of each element in a single lins
str(shopping_list)
str(another_list)

#Create a list with different objects such as vector, matrix, dataframe
vector1<-1:5
matrix1<-matrix(1:10,ncol=5)
matrix1


#Create a list with vector1, matrix1,df
list1<-list(vector1,matrix1,df)
list1


#ACCESSING ELEMENTS OF A LIST
#Elements in a list are accessed using the index.
#Integer, character & Logical vectors can be used for indexing.

#Using the integer vector to display first three elements of the list.
shopping_list[c(1:3)]
another_list[c(1:4)]

#using logical vector to display the first three elements of the list
shopping_list[c(TRUE,TRUE,TRUE)]
shopping_list[c(TRUE,FALSE,TRUE)]
#T & F can also be used instead of True & False respectively.
another_list[c(T,F,T,F,T)]

#using character vector to display the elements matching the labels
shopping_list[c("ID","Item")]
another_list[c("ID","Item","In Stock")]

#using the index value with negative sign to eliminate from displaying
shopping_list[-2]
another_list[-3]

# select the 10th row of the built-in R data set EuStockMarkets
df <- EuStockMarkets[1:10,]
df

#Indexing using [] will give the sublist of the component and not the content.
#To retrieve the content of the list use [[]].

shopping_list[[2]]
another_list[[3]]

#To understand the difference.
typeof(shopping_list[2])
typeof(shopping_list[[2]])
typeof(another_list[1])
typeof(another_list[[1]])

#To select an element from the list use [[index]] where index represents the position of the element in the list
list1[[1]] #Selects the vector
list1[[2]] # Selects the Matrix

#As an alternative to [[]] for accessing the contents of the list, $ followed by the label can be used.
#$ operator supports partial matching as well as recursive look up.
shopping_list$Item
#Partial tag matching
shopping_list$Pr
#Recursive look up
another_list$Rating[3]

#MODIFYING THE EXISTING LISTS
shopping_list["Price"]<-4.5
shopping_list
another_list[["Item"]]<-"Sharpers"
another_list

#Adding additional elements to the list
another_list[["Manufacturer"]]="Harper Collins"
another_list[["Shipping"]]<-2.0
another_list

#Removing elements in the list by assigning them the value NULL
another_list[["Shipping"]]<-NULL
another_list
