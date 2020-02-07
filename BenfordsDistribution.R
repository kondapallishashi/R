#Benfords Distribution
#Define vectors for ID and the probablilities.
V<-c(1:9)
V
P<-c(0.301,0.176,0.125,0.097,0.079,0.067,0.058,0.051,0.046)
P
sum<-(V*P)
Dev <- (V - mean(V))^2
Dev
sum(Dev * P)
stdev <- sqrt(sum(Dev * P))
stdev
