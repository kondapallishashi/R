#Print the count of even and odd numbers in a vector
#Demonstrates for and if..else loops

x <- c(2,5,3,9,8,11,6)
evenCount <- 0
oddCount<-0

for (val in x) {
  if(val %% 2 == 0)  evenCount = evenCount+1 else oddCount=oddCount+1
}

print(evenCount)
print(oddCount)