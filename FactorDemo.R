#Demonstrates the Factor in R

#Factors are variables in R which take on a limited number of different values; 
#such variables are often referred to as categorical variables.

#In a dataset, we can distinguish two types of variables: 
#categorical 
#continuous.

#In a categorical variable, the value is limited and usually based on a particular finite group. 
#For example, a categorical variable can be countries, year, gender, occupation.
#A continuous variable, however, can take any values, from integer to decimal. 
#For example, we can have the revenue, price of a share, etc..

#Categorical Variables
#R stores categorical variables into a factor. 
#Characters are not supported in machine learning algorithm, and the only way is to convert a string to an integer.

#Syntax:
#factor(x = character(), levels, labels = levels, ordered = is.ordered(x))

#x: A vector of data. Need to be a string or integer, not decimal.
#Levels: A vector of possible values taken by x. This argument is optional. The default value is the unique list of items of the vector x.
#Labels: Add a label to the x data. For example, 1 can take the label `male` while 0, the label `female`.
#ordered: Determine if the levels should be ordered.

# Create gender vector
gender_vector <- c("Male", "Female", "Female", "Male", "Male")
class(gender_vector)
gender_vector
# Convert gender_vector to a factor
factor_gender_vector <-factor(gender_vector)
class(factor_gender_vector)
factor_gender_vector

#A categorical variable can be divided into nominal categorical variable and ordinal categorical variable.

#Nominal Categorical Variable
#A categorical variable has several values but the order does not matter. 
#For instance, male or female categorical variable do not have ordering.

# Create a color vector
color_vector <- c('blue', 'red', 'green', 'white', 'black', 'yellow')
# Convert the vector to factor
factor_color <- factor(color_vector)
factor_color


# Create Ordinal categorical vector 
day_vector <- c('evening', 'morning', 'afternoon', 'midday', 'midnight', 'evening')
# Convert `day_vector` to a factor with ordered level
factor_day <- factor(day_vector, order = TRUE, levels =c('morning', 'midday', 'afternoon', 'evening', 'midnight'))
# Print the new variable
factor_day

## Levels: morning < midday < afternoon < evening < midnight
# Append the line to above code
# Count the number of occurence of each level
summary(factor_day)


#Continuous Variables
#Continuous class variables are the default value in R. 
#They are stored as numeric or integer. 
#We can see it from the dataset below. mtcars is a built-in dataset. 
#It gathers information on different types of car. 
#We can import it by using mtcars and check the class of the variable mpg, mile per gallon. 
#It returns a numeric value, indicating a continuous variable.

dataset <- mtcars
class(dataset$mpg)
dataset


