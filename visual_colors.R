
temp<-airquality$Temp

marks<-c(66,80,72,67,64)

barplot(marks, col=c("#FF0099","#CCFF00","#33FF00",
                    "#00FF66","#FF9900"), main="With 5 colors")
barplot(marks, col=c("#FF99FF","#0066FF","#00FF4D"), main="With 3 colors")

barplot(marks, col=rainbow(5), main="rainbow")
barplot(marks, col=heat.colors(5), main="heat.colors")
barplot(marks, col=terrain.colors(5), main="terrain.colors")
barplot(marks, col=topo.colors(5), main="topo.colors")
barplot(marks, col=cm.colors(5), main="cm.colors")
