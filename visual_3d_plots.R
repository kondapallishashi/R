

cone <- function(x, y){
  sqrt(x^2+y^2)
}

x <- y <- seq(-1, 1, length= 20)
x
y

z <- outer(x, y, cone)
z

#Creating the cone plot
persp(x, y, z)

#Additional details can be added to the plot using the below parameters
#main="Title of the plot"
#xlab="Label for the x-axis"
#ylab="Label for the y-axis"
#zlab-"Label for the z-axis"

#Rotational Angles
#We can use theta and phi to define the rotational angles.
#By default, the theta, azimuthal direction is 0
#By default, the phi,coaltitude direction is 15.
#col="color" can be used for colouring
#shade=0.5 to add shade

persp(x, y, z,
      main="Perspective Plot of a Cone",
      zlab = "Height",
      theta = 30, phi = 15,
      col = "springgreen", shade = 0.5)