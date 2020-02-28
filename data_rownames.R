#Handling rownames to column names function.
#This is part if tidyverse package.
#below are some of the functions that can be used.

#has_rownames(dataFrame)
#remove_rownames(dataFrame)
#rownames_to_column(dataFrame, var = "rowname")
#rowid_to_column(dataFrame, var = "rowid")
#column_to_rownames(dataFrame, var = "rowname")

#Check if tidyverse package is installed. If not install with install.packages("tidyverse)
library("tidyverse")
#Outputs TRUE
has_rownames(mtcars)
#Outputs FALSE
has_rownames(iris)


mtcars.no.rownames<-remove_rownames(mtcars)
mtcars.no.rownames
#Now outputs FALSE
has_rownames(mtcars.no.rownames)

#Datasets with Rownames can be accessed using the row names as well.
mtcars[4,6]
mtcars[1:10,2:6]
mtcars["Camaro Z28",2]
mtcars[c("Datsun 710","Merc 240D","Merc 230"),2:6]


