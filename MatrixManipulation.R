#Matrix Manipulation

acctdata<-c(
  1,   132,  86.7,
  2,   50,   50.7,
  3,   32,   36,
  4,   20,   27.9,
  5,   19,   22.8,
  6,   11,   19.3,
  7,   10,   16.7,
  8,   9,    14.7,
  9,   5,    13.2
)

acctdata<-matrix(acctdata,9,3,byrow=TRUE)
colnames(acctdata)<-c("digit","actual","expected")
acctdata

chisquare<-sum((acctdata[,2]-acctdata[,3])^2/acctdata[,3])
chisquare

