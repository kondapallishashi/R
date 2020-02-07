#Demonstrates the Switch Function

colors<-c("red","blue","green","orange","yellow")
color<-switch(2,"red","blue","green","orange","yellow")
#If the numerical range is out of bound, NULL value is returned and a warning is issues that swith with no alternatives
color<-switch(0)
color
color<-switch(8)
color

#Switch can also be used with string expressions
selection<-switch("color","color"="red", "shape"="round", "length"=10)
selection

selection<-switch("shape","color"="red", "shape"="round", "length"=10)
selection
