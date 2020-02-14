#Demonstrates the pie chart

expenditure<-c("Housing"=600,"Food"=300,"Clothes"=150,"Entertainment"=100,"Other"=200)
expenditure

pie(expenditure)

pie(expenditure,
    labels=as.character(expenditure),
    main="Monthly Expenditure Breakdown",
    col=c("red","orange","yellow","blue","green"),
    border="brown",
    clockwise=TRUE
)