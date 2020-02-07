#Demonstrates the for Loop.
x<-c(1:5)
for(n in x) print(n*10)

#Demonstrates the while loop.
even<-0
while(even<10) {
  even<-even+2
  print(even)
}

#Demonstrates the repeat loop
i<-1
repeat {
  print(i)
  i<-i+1
  if(i>5)
  {
    break
  }
}

