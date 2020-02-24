#Demonstrates the visualization of the data in R
#Demonstrates the Bar Plot

#construct a vector with maximum marks
marks<-c(66,80,72,67,64,89)
barplot(marks)

#More details can be added to the plot so that the data being represented is better explained.
#main -s used to give a title
#xlab,ylab is used for labelling x and y axis respectively
#names.arg is used to label the names of each data element
#col="Color_Name)" is used to define the colour of the plot
#horiz=TRUE is used to specify that the bar plot be designed in horizontal direction.
#More details can be obtained by ?barplot()
barplot(marks, 
        main="Marks Obtained",
        xlab="Subjects",
        ylab="Marks",
        names.arg=c("English","Mathematics","Physics","Chemistry","Biology","Social Studies"),
        col="blue",
        horiz=TRUE
        )

#Displaying categorical data using bar plots.
#Use Case: For example, consider the age of all the freshmen in a collage. There will be 
#huge number of students belonging to a specific age. Plotting the age in a bar plot will not provide any useful information
#but displaying how many students fall within a specific age will provide valueble insight

#consider a vector with ages of freshman
age<-c(17,18,18,17,18,19,18,16,18,18)

#use the table() function to get the count of students in each specific age
table(age)

#Plot the number of students in each age
barplot(table(age),
        main="Age count of 10 students",
        xlab="Age",
        ylab="count",
        border = "red",
        col="blue",
        density=10
        )

#Plotting bar plots using higher dimension tables.
#Using Titanic data set which provides data in 4 dimensions, class, sex, age, survival.
#margin.table() function is used to sum up the data according to a given index.
#To understand display all the below 5 lines of data.

Titanic
margin.table(Titanic,1)
margin.table(Titanic,2)
margin.table(Titanic,3)
margin.table(Titanic,4)

barplot(margin.table(Titanic,1), main="Passengers")
barplot(margin.table(Titanic,2))
barplot(margin.table(Titanic,3))
#Survived
barplot(margin.table(Titanic,4))

#To input matrix as the input for bar plot.

#FIGURE OUT A WAY TO BUILD THE MATRIX FROM TITANIC DATASET

#THE MATRIX NEEDS TO BE IN THE FORMAT BELOW

#Survival 1st 2nd 3rd Crew
#No  122 167 528  673
#Yes 203 118 178  212


#THIS WILL NOT WORK UNTILL titanic.data is constructed.
#ALSO ADD ANOTHER ARGUMENT beside=TRUE 
barplot(titanic.data,
        main = "Survival of Each Class",
        xlab = "Class",
        col = c("red","green")
)
legend("topleft",
       c("Not survived","Survived"),
       fill = c("red","green")
)

titanic.data

barplot(titanic.data,
        main = "Survival of Each Class",
        xlab = "Class",
        ylab="count",
        col = c("red","green")
)



