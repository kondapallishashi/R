#Demonstrates the data structures in R
#Demonstrates the behaviour of data frames

#To Construct a data frame use the data.frame() function
df<-data.frame("SN"=1:2,"Age"=c(21,15),"Name"=c("Dave","John"))
df

#To read data frame from a csv file from the current working directory.
#na.strings="" is passed so that empty values are read as "" empty strings.
titanic.data<-read.csv("Titanic.csv",header=TRUE,na.strings = "")
titanic.data
#To see the Structure of the data frame.
#we see PassengerId,Survived,Pclass,Name,Sex,Age,Parch,Ticket,Fare,Cabin and Embarked columns 
str(titanic.data)
View(titanic.data)

#To get the data from any specific column we can use $ symbol appended to dataframe followed by column name
titanic.data$Name

#To get a subset of rows and columns use : operator to define the rows and columns
#The below statement displays rows 10-14 and columns 3-5
titanic.data[10:14,3:5]

#To get the a subset of non consecutive rows and columns define vectors for rows and a vector for columns
titanic.data[c(5:8,12,14,16),c(3:5,7,9,10)]

#To get the data based on conditional result.
titanic.data[titanic.data$Pclass==1,2:6]
#This can also be done using the subset() 
subset(titanic.data[,2:6,titanic.data$Pclass==1])

titanic.data[titanic.data$Sex=="female",1:6]
#This can also be done using the subset()
subset(titanic.data[,1:6],titanic.data$Sex=="female")

#Number of rows can be calculated using nrows
numberOfRows<-nrow(titanic.data)
numberOfRows

#To calculate the number of NA values in the dataset
#We can use is.na() along with sum() function to calculate the number of NA values
#is.na() returns true if the value is NA and false if it is not
sum(is.na(titanic.data))

#Dropping columns 
#Column can be dropped by accessing the column using $ and assigning NULL
titanic.data$Pclass<-NULL
str(titanic.data)

#Dropping rows
#Rows can be dropped by passing the number of rows to be dropped as vector preceded by -ve sign
titanic.data<-titanic.data[-c(1:5,7,9,12,18)]
#To get the new number of rows.
numberOfRows<-nrow(titanic.data)



#In Titanic data, a lot of missing values are observed in Cabin and Age columns
#A missingness plot can be created to see the extent of data missing
#library Amelia is required to plot this graph
#The Amelia package is installed using install.packages("Amelia")
library("Amelia")

#To map the missing data
missmap(titanic.data,col=c("black","grey"))

#As there are many NA values in Cabin, this column can be dropped.
#Since the PassengerID is nothing but a unique identifier for the records, it can also be dropped.
#Since, Name, Fare, Embarked, and ticket data does not impact survival, we can drop them as well.
#We will use select() from dplyr package to select only the required columns.

library(dplyr)
data.frame = select(titanic.data, Survived, Pclass, Age, Sex, SibSp, Parch)
# The data.frame now contains only the selected columns.
data.frame

#Dropping the rows with NA values in Age Column
data.frame<-na.omit(data.frame)
data.frame

#After cleansing all the data, check the structure of the data.frame
str(data.frame)

#From the structure of the data frame we can see that the Survived and Pclass are represented as integers
#However, Pclass is an ordinal categorical variable and Survived is a nominal Categorical variable
#Categorical variables can take on one of a limited and usually fixed number of variables.
#These integer variables need to be converted to factors.
#For converting nominal categorical variables use factor method
data.frame$Survived<-factor(data.frame$Survived)

#For converting ordinal categorical variables to factors, pass order=TRUE and pass the level arguments in decending order.
data.frame$Pclass<-factor(data.frame$Pclass,order=TRUE,levels=c(3,2,1))

#Test the changes in structure
str(data.frame)

#VISUALIZING THE DATA
#Correlation Plot

library(GGally)
ggcorr(data.frame,
       nbreaks = 6,
       label = TRUE,
       label_size = 3,
       color = "grey50")

#Survived Count
library(ggplot2)
#aes() is used to specify x and y axes values
#+ operator is used to add more details
#geom_bar() is used to specify bar chart, width is the bar width, fill is color of bars.
# geom_text() is to set the text in the plot. 
#theme_classic() is a built in theme
ggplot(data.frame, aes(x = Survived)) +
  geom_bar(width=0.2, fill = "green") +
  geom_text(stat='count', aes(label=stat(count)), vjust=-0.5) +
  theme_classic()


#Survived count by sex.
#fill=Sex; Fill is provided with Sex attribute which must be a factor to fill in the data from Sex.
#To make the bars appear side by side position=position_dodge() is used.
#More females survived compared to males
ggplot(data.frame, aes(x = Survived, fill=Sex)) +
  geom_bar(position = position_dodge()) +
  geom_text(stat='count', 
            aes(label=stat(count)), 
            position = position_dodge(width=1), vjust=-0.5)+
  theme_classic()

#Survival by class.
#The ggplot() parameters are same
#There are more survivors in Class 1 than from other classes
ggplot(data.frame, aes(x = Survived, fill=Pclass)) +
  geom_bar(position = position_dodge()) +
  geom_text(stat='count', 
            aes(label=stat(count)), 
            position = position_dodge(width=1), 
            vjust=-0.5)+
  theme_classic()


#Age density plot
#density plots can be created using geom_desnsity().
ggplot(data.frame, aes(x = Age)) +
  geom_density(fill='coral')

#Survival By Age

# Discretize age to plot survival
data.frame$Discretized.age = cut(data.frame$Age, c(0,10,20,30,40,50,60,70,80,100))
# Plot discretized age
ggplot(data.frame, aes(x = Discretized.age, fill=Survived)) +
  geom_bar(position = position_dodge()) +
  geom_text(stat='count', aes(label=stat(count)), position = position_dodge(width=1), vjust=-0.5)+
  theme_classic()
data.frame$Discretized.age = NULL

#Create train and test data.
#To create a train of data, write a function that takes in a fraction to calculate how many records needs to be selected
train_test_split = function(data, fraction = 0.8, train = TRUE) {
  total_rows = nrow(data)
  train_rows = fraction * total_rows
  sample = 1:train_rows
  if (train == TRUE) {
    return (data[sample, ])
  } else {
    return (data[-sample, ])
  }
}

#Create train and test sets.
train <- train_test_split(data.frame, 0.8, train = TRUE)
train
test <- train_test_split(data.frame, 0.8, train = FALSE)
test

#Decision Tree Model
#The decision tree model is built using the rpart() available in rpart library
#The attributes on the left of ‘~’ specify the target label and attributes on left specify the features used for training. 
#‘data’ argument is your training data and method= ‘class’ tells that we are trying to solve a classification problem.

library(rpart)
library(rpart.plot)
fit <- rpart(Survived~., data = train, method = 'class')
rpart.plot(fit, extra = 106)



#Accuracy
#After training the model, we use it to make predictions on the test set using predict() function. We pass the fitted model, the test data and type = ‘class’ for classification. It returns a vector of predictions. The table() function produces a table of the actual labels vs predicted labels, also called confusion matrix.
predicted = predict(fit, test, type = 'class')
table = table(test$Survived, predicted)

#The accuracy is calculated using (TP + TN)/(TP + TN + FP + FN). I got an accuracy of 81.11%
dt_accuracy = sum(diag(table)) / sum(table)
paste("The accuracy is : ", dt_accuracy)

#Fine tune the decision tree
#You can fine tune your decision tree with the control parameter by selecting the minsplit( min number of samples for decision), minbucket( min number of samples at leaf node), maxdepth( max depth of the tree).

control = rpart.control(minsplit = 8,
                        minbucket = 2,
                        maxdepth = 6,
                        cp = 0)
tuned_fit = rpart(Survived~., data = train, method = 'class', control = control)
dt_predict = predict(tuned_fit, test, type = 'class')
table_mat = table(test$Survived, dt_predict)
dt_accuracy_2 = sum(diag(table_mat)) / sum(table_mat)
paste("The accuracy is : ", dt_accuracy_2)
