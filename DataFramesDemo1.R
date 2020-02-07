#Data Frames - Another Example
#Define two vectors from which we will create the data frames

#Defines a vector with student names
people<-c("Kim","Bob","Ted","Sue","Liz","Amanada","Tricia","Johnathan","Luis","Isabel")
#Defines a vector with scores
scores<-c(17,19,24,25,16,15,23,24,29,17)

#Create a Data frame
quiz_scores<-data.frame(people,scores)
quiz_scores

#Performance Tip. We can remove the unwanted objects using the rm() function
#Now that data frame is created from the vectors people and scores, we can remove them
rm(people,scores)
#See the error when accessing these vectors
people
scores
#verify if people, scores data is still in data frame quiz_scores
quiz_scores

#The elements in the data frames can be accessed much the same way using the index
quiz_scores[1]
quiz_scores[2]

#The columns can also be accessed using the $ sign followed by column name
quiz_scores$people
quiz_scores$scores

#use attach to access columns of data frame as vectors
attach(quiz_scores)
people
scores
class(people)

#To create a data frame and edit in R Studio. (Not supported in cloud version)
Min_Wage <- data.frame(Year =numeric(), Value=numeric())
Min_Wage <- edit(Min_Wage)