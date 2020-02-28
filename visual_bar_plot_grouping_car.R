#Demonstrates grouping 
Cars93
str(Cars93)

#Selective data can be retrieved using multiple formats as shown below
cars.type1<-Cars93[c(4,6,8,10)]
cars.type1
cars.type2<-Cars93[c(Cars93$Type,Cars93$Origin)]
cars.type2

#Using subset to get the Type and Origin data from the Cars93 Dataset
cars.type<-subset(Cars93,select=c("Type","Origin"))
cars.type

table(cars.type)
barplot(table(cars.type), beside = TRUE)

barplot(cars.type)

library(dbplyr)
usa.cars<-filter(cars.type,Origin=="USA")
usa.cars
t(cars.type)
col.names<-c("blue","red")
barplot(t(table(cars.type)),
        beside=TRUE, 
        main="Bar plot of cars made in USA and non USA",
        xlab="Car Type",
        ylab="count of cars",
        ylim=c(0,15),
        axis.lty = "solid",
        col=col.names,
        legend("right", rownames(t(table(cars.type))), cex=0.8,fill=col.names,title="Origin")
        )

