#Demonstrates Plot

#passa vector to generate a scatter plot of magnitute vs index

#Observe points at (1,3) and (2,5)
plot(c(1,2),c(3,5))

#generally two vectors are passed.
x<-seq(-pi,pi,0.1)
x
plot(x)
plot(x,sin(x))

#Additional details can be added to the plot function.
#
plot(x,sin(x),main="The Sine Function",ylab="sin(x)")

#Changing the color and plot type.

#"p" - points
#"l" - lines
#"b" - both points and lines
#"c" - empty points joined by lines
#"o" - overplotted points and lines
#"s" and "S" - stair steps
#"h" - histogram-like vertical lines
#"n" - does not produce any points or lines

#Make type=b,c,o,s,h,n
plot(x, sin(x),
     main="The Sine Function",
     ylab="sin(x)",
     type="h",
     col="blue")

#Overlaying plots using the legend() function
#use lines

plot(x, sin(x),
     main="Overlaying Graphs",
     ylab="",
     type="l",
     col="blue")
lines(x,cos(x), col="red")
legend("topleft",
       c("sin(x)","cos(x)"),
       fill=c("blue","red")
)