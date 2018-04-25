##set directory and read data
setwd("../")
Electric_power<-read.csv('~/Data Science/assignment5/household_power_consumption.txt', header=T, sep=";", na.strings="?")



##Converted the column "Date" in a date format
Electric_power$Date<-as.Date(Electric_power$Date, format="%d/%m/%Y")



##Extracted the data we will use 
Subset_Electric_power<-subset(Electric_power,subset=(Date=="2007-02-01"|Date=="2007-02-02"))

##Created a new column which contains the complet date on the shape "%Y-%m-%d %H:%M:%S"
Subset_Electric_power$Completdate<-strptime(paste(Subset_Electric_power$Date, Subset_Electric_power$Time), format="%Y-%m-%d %H:%M:%S")

##Plot3
with(Subset_Electric_power, plot(x=Completdate, y=Sub_metering_1, xlab="", ylab="Energy sub metering", type="l"))
with(Subset_Electric_power, lines(x=Completdate, y=Sub_metering_2, col="red"))
with(Subset_Electric_power, lines(x=Completdate, y=Sub_metering_3, col="blue"))
legend("topright",lty=1,col=c("Black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Copy plot3 to a PNG file
dev.copy(png,file="plot3.png", height=480, width=480)
dev.off()

