#R has functions to generate random numbers from many standard distributions
#like uniform distribution, binomial distribution, normal distribution.
#To find the available distributions, use ?distribution

#To generate random numbers from uniform distribution.
runif(1)
runif(5)
runif(5,min=1,max=10)

#To generate random numbers from normal distribution
rnorm(1)
rnorm(5)
#We can provide the mean and standatd deviation values as well.
rnorm(5,mean=10,sd=2)
