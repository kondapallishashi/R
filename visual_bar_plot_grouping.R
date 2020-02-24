#Demonstrates grouping in bar plots.
#uses HairEyeColor Dataset
library(datasets)
#HairEyeColor dataset contains details about eye color, hair color segregated into males and females set.
#Use [] operator to access the details of females sample
females <- HairEyeColor[,,2]
females
#Eye
#Hair    Brown Blue Hazel Green
#Black    36    9     5     2
#Brown    66   34    29    14
#Red      16    7     7     7
#Blond     4   64     5     8

#if we use females directly in a barplot, the eye color is taken as x axis.
#TRY: barplot(females) to see the barplot with Brown,Blue,Hazel, Green in X-Axis and the values stacked on top of each other.
#However we need the Hair color to be on x axis. use t() function to transpose the data.
color.names<-c("Brown","deepskyblue","greenyellow","darkgreen")

barplot(t(females),
        beside=TRUE, #To make the bars display side by side instead of stacked
        ylim=c(0,70),     #The maximum value is 66, so setting the y-axis limit to 70
        xlab="Hair Color",
        ylab="Frequency of Eye Color",
        main="Hair Color Vs Eye Color Plot for Females",
        col=c("Brown","deepskyblue","greenyellow","darkgreen"),
        axis.lty="solid",
        legend("top",rownames(t(females)),cex =0.8,fill=color.names,title="Eye Color")
        )

#Plotting the same for males.
males<-HairEyeColor[,,1]
males

# In case the below error is displayed, comment out legend, execute and then include the legend statement

#Error in width/2 : non-numeric argument to binary operator
#In addition: Warning message:
#In mean.default(width) : argument is not numeric or logical: returning NA

barplot(t(males),
        beside=TRUE, #To make the bars display side by side instead of stacked
        ylim=c(0,70),     #The maximum value is 66, so setting the y-axis limit to 70
        xlab="Hair Color",
        ylab="Frequency of Eye Color",
        main="Hair Color Vs Eye Color Plot for Females",
        col=c("Brown","deepskyblue","greenyellow","darkgreen"),
        axis.lty="solid",
        legend("top",rownames(t(females)),cex =0.8,fill=color.names,title="Eye Color")
)
