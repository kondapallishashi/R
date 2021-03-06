#This program demonstrates the usage of vectors in R Programming Language
#Vectors can be defined by using the combine function c(x1,x2,x3...)
vec1<-c(1,3,5,7,9)
vec1
vec2<-c(2.4,4.6,6.8,8.2,10.4)
vec2
#Vectors with range of numbers can be created using the : between the range of elements
vec3<-c(1:5)
vec3
#Its not absolutely required to use c() to create a vector with sequence of numbers
vec4<-5:10
vec4

#Since elements in vectors need to be of same data type, if other type elements are used they are coerced into higher types.
#The order of coercion is logical to integer to double to character.
v1<-c(FALSE,2)
v1 #FALSE IS coerced to 0. Also please note in logical scenarios 0 evaluates to FALSE and Non-Zero element evaluates to TRUE

v2<-c(FALSE,2,3.14)
v2

v3<-c(FALSE,2,3.14,"Area")
v3


#Vectors can also be created using the seq()
sequence_vector<-seq(1:10)
sequence_vector
sequence_vector1<-seq(10)
sequence_vector1

seq_vector<-seq(1,5,by=0.5) #0.5 is step size. by= is optional
seq_vector
seq_vector<-seq(1,5,0.5) #this is same as the above statement.
#When using the named arguments the order of the arguments does not matter
seq_vector<-seq(to=5,by=0.5,from=1)
seq_vector

seq_vector1<-seq(1,5,length.out=4) # will be rounded to an integer if fractional
seq_vector1


#There is a repetitive function which can also be used for creating a vector
rep_vector<-rep(1,10)
rep_vector

#rep() can be used to repeat a set of fixed numbers multiple times.
rv1<-c(2,4,6)
#Repeat the values in vector rv1 3 times.
rpv1<-rep(rv1,3)
rpv1
#elements in the rv1 can also be repeated multiple times using rep()
times<-c(3,2,2)
rpv1<-rep(rv1,times)
rpv1




#Character Vector
char_vec<-c("Apple","Orange","Grape","Banana","Pears")
char_vec
#Boolean Vector
bool_vec<-c(TRUE,FALSE,FALSE, TRUE)
bool_vec

#Identifying the vector type using class() 
class(vec4)
class(vec2)
class(char_vec)
class(bool_vec)


#Identifying the vector type using mode()
mode(vec4) #Outputs numeric
mode(vec2) #Outputs numeric
mode(char_vec) #Outputs character
mode(bool_vec) #Outputs logical

#identifying the vector type using typeof()
typeof(vec1) #outputs double
typeof(vec2) #outputs double
typeof(char_vec)
typeof(bool_vec)

#identifying the size of the vector using length()
length(vec3)

#------------------------------------------------------------------
#Scalar Arithmetic operation or Vector recycling
#When we attempt to add a scalar value to a vector, the shorter vector will be vectorized and operation will be performed.
a<-c(1:10)
a
b<-10
a+b #Observe that value 10 is added to each element in the vector a
c<-c(0,1)
c
a+c #0 is added to all odd elements and 1 is added to all even elements
d<-c(1,2,3)
a+d #throws a warning that longer object length is not a multiple of shorter object length

#Scalar operation on vectors where the ordering has an impact
2+3*x
(2+3)*x

#ARITHMETIC OPERATIONS ON THE VECTORS
#For simplicity sake, lets take small vectors with 5 elements each
x<-c(1,2,3,4,5)
y<-c(6,7,8,9,10)

#Adding two vectors
x+y

#subtracting one vector from the other
y-x

#Multiplying one vector with another
x*y

#Dividing one vector with another
y/x

#Calculating Modulus of each element
y%%x #[1] 0 1 2 1 0

#To display the sum of all the elements in the vector
sum(x)

#Square Root of the elements of the vector
sqrt(x) #Displays : [1] 1.000000 1.414214 1.732051 2.000000 2.236068

#Define a complex number
complex_number<-3+2i
#To extract real number use Re() function
Re(complex_number)
#Tp extract imaginary number Im() function
Im(complex_number)

#Performing multiplication with vector and a complex number
x*complex_number #Displays:[1] 3+ 2i  6+ 4i  9+ 6i 12+ 8i 15+10i

#Appending vectors to make a bigger vector
x<-c(x,6,7,8)
x

#Two vectors can also be appended
#x<-c(x,y)

#append() can also be used to add more elements to an existing vector.
x<-append(x,9)
x

#To add an element to the beginning of the vector, use prepend() function
#THIS WAS READ IN DUMMIES BOOK..BUT NOT WORKING
x<-prepend(x,0)
x



#Slicing a vector
num_vec<-c(1:10)
num_vec
num_vec[1:6]

#comparing elements of a vector
compare_vec<-num_vec>5
compare_vec

#Display elements that are greater than 5
num_vec[num_vec>5]

#Display elements that are greater than 4 and less than 7
num_vec[(num_vec>4) & (num_vec<7)]



