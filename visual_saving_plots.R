#saving the graphs to file system
temp<-airquality$Temp

#Saving the plot in jpeg format in the current directory with default resolution 480 x 480
jpeg(file="saving_plot1.jpeg")
hist(temp, col="darkgreen")
dev.off()

#Saving a plot in png format with a custom dimensions.
#The location can be specified along with the filename. C:/R/plots/saving_plot2.png
png(file="saving_plot2.png",
    width=600, height=350)
hist(temp, col="gold")
dev.off()

#Saving a plot in bmp format with details such as width, height in inches and resolution of 100
bmp(file="saving_plot3.bmp",
    width=6, height=4, units="in", res=100)
hist(temp, col="steelblue")
dev.off()

#Saving the plot in tiff format.
tiff(file="saving_plot3.tiff",
     width=6, height=4, units="in", res=100)
hist(temp, col="steelblue")
dev.off()

#To save the plot in ps format
postscript(file="saving_plot4.ps")
hist(temp, col="violet")
dev.off()
#To save the plot in vector formats
#Save the plot in pdf format

pdf(file="saving_plot4.pdf")
hist(temp, col="violet")
dev.off()

