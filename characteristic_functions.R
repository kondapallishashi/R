#Characteristic Function of uniform random variable, normal random variable, poisson random variable

#Characteristic function of uniform distribution over an interval [-1,1]

# Plot of Characteristic Function of a U(-1,1) Random Variable
#Define the intervals
a <- -1 
b <- 1
#Generate uniform distribution
t <- seq(-20,20,.1)
#Formula for calculating chung's characteristic function of uniform distribution
chu <- (exp(1i*t*b)-exp(1i*t*a))/(1i*t*(b-a))

plot(t,
    chu,
    "l",
    ylab=(expression(varphi(t))),
    main="Characteristic Function of Uniform Distribution [-1, 1]"
    )

# Plot of Characteristic Function of a N(0,1) Variable
mu <- 0; sigma <- 1
t <- seq(-5,5,0.1)
chsnv <- exp(1i*t*mu-.5*(sigma ^ 2)*(t ^ 2))

plot(t,
    chsnv,
    "l",
    ylab=(expression(varphi(t))),
    main="Characteristic Function of Standard Normal Distribution"
    )

# Plot of Characteristic Function of Poisson Random Variable
lambda <- 6
t <- seq(0,20,.1)
chpois <- exp(lambda*(exp(1i*t)-1))
plot(t,chpois,"l") 
# Warning omitted and left as exercise
# for the reader to interpret