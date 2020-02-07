#Demonstrates Matrix function in R
#Matrix in R can be created using the function matrix(data,nrow,ncol,byrow=FALSE)

"byrow=TRUE ensures that the values are filled by row"
matrix_a<-matrix(c(1:12),nrow=4,byrow=TRUE)
matrix_a

#Adding column names using colnames() to the matrix for easy reading.
colnames(matrix_a)<-c("A","B","C")
matrix_a

#print dimension of the matrix with dim()
dim(matrix_a)

#Matrix Details
mode(matrix_a)
typeof(matrix_a)
class(matrix_a)
attributes(matrix_a)

#byrow=FALSE will fill the matrix from top to bottom
matrix_b<-matrix(c(1:12), ncol=3,byrow=FALSE)
matrix_b

matrix_a<-cbind(matrix_a,c(13:16))
matrix_a

#add more than one more column by creating another matrix and adding to the original matrix
matrix_a2<-matrix(c(17:24),ncol=2,byrow=FALSE)
matrix_c<-cbind(matrix_a,matrix_a2)
matrix_c
dim(matrix_c)

#adding a row using rbind() function
add_row<-c(25,50,75,100,125,150)
matrix_d<-rbind(matrix_c,add_row)
matrix_d
#The new dimensions would be 5X6
dim(matrix_d)

#slicing a matrix
#Displaying the row element under the column named "B"
matrix_d[1,"B"]

"Displaying the first row"
matrix_d[1,]
"Diplaying the first column"
matrix_d[,1]
"Displaying the third column"
matrix_d[,3]

#results in the element in 2nd row, 3rd column
matrix_d[2,3]
#results in a matrix with elements from rows 2 to 4 and columns 3 to 5
matrix_d[2:4,3:5]
matrix_d

#ARITHMETIC OPERATIONS ON MATRICES
#Define three matrices, two of same size and third with the same number of columns as the first 2
A<-matrix(c(1:6),2,3,byrow=TRUE)
B<-matrix(c(2,4,6,8,12),2,3,byrow=FALSE)
C<-matrix(c(4:9),3,2,byrow=TRUE)
A
B
C

#Perform Addition
A+B

#Perform Subtraction
A-B

#Perform Division
A/B

#Perform Modulus
A%%B

#Perform Multiplication
A*B

#Perform Matrix Multiplication
A%*%C
B%*%C







#Inversion of Matrix. Inversion is only possible on the square matrices
matrix1<-matrix(c(
                  4,0,5,
                  0,1,-6,
                  3,0,4
                  ),3,3,byrow=TRUE)

matrix1
#solve() will generate the inverse matrix of matrix1
matrix2<-solve(matrix1)
matrix2
#Perform matrix multiplication. Generates identity matrix.
matrix1%*%matrix2
