#More details on the apply,lapply & sapply
#Define three vectors of variable lengths
class1<- c(17,18,12,13,15,14,20,11,16,17)
class2<- c(18,15,16,19,20,20,19,17,14)
class3<- c(17,16,15,18,11,10)
classes<- list(class1, class2, class3)
lapply(classes,length)
sapply(classes,length)
sapply(classes,mean)
sapply(classes,summary)
