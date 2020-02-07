#Demonstrates the creation of classes in S4 format. 
setClass("member",representation(name="character", 
                                 gender="character",
                                 age="numeric",
                                 salary="numeric"
                                 ))

#Create a new instance of the class using the keyword new
person1<-new("member",name="shashi",gender="male",age=40,salary=24000)
person1

#In S4 notation, member variables are known as slots and are references using @ symbol
person1@age=41
person1

