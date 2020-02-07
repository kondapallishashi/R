#Data Distribution in R

#read the data in the csv file into a data frame.
state<-read.csv("state.csv")
state

quantile(state[["Murder.Rate"]],p=c(.05,.25,.50,.75,.95))

#To display the data in a Box Plot
boxplot(state[["Population"]]/1000000,ylab="Population (Millions)")

#To generate a frequency table

breaks <- seq(from=min(state[["Population"]]),
              to=max(state[["Population"]]), length=11)
pop_freq <- cut(state[["Population"]], breaks=breaks,
                right=TRUE, include.lowest = TRUE)
table(pop_freq)

#To display a histogram
hist(state[["Population"]], breaks=breaks)

#Density Estimates
hist(state[["Murder.Rate"]], freq=FALSE)
lines(density(state[["Murder.Rate"]]), lwd=3, col="blue")