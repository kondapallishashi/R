#Demonstrates the percentiles in R

state<-read.csv("state.csv")
state

sd(state[["Population"]])
IQR(state[["Population"]])
mad(state[["Population"]])

