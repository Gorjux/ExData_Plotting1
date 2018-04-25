##set directory and read data
setwd("../")
Electric_power<-read.csv('~/Data Science/assignment5/household_power_consumption.txt', header=T, sep=";", na.strings="?")



##Converted the column "Date" in a date format
Electric_power$Date<-as.Date(Electric_power$Date, format="%d/%m/%Y")



##Extracted the data we will use 
Subset_Electric_power<-subset(Electric_power,subset=(Date=="2007-02-01"|Date=="2007-02-02"))

##Created a new column which contains the complet date on the shape "%Y-%m-%d %H:%M:%S"
Subset_Electric_power$Completdate<-strptime(paste(Subset_Electric_power$Date, Subset_Electric_power$Time), format="%Y-%m-%d %H:%M:%S")


##Plot2
with(Subset_Electric_power, plot(Completdate, Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)"))

##Copy plot2 to a PNG file
dev.copy(png,file="plot2.png", height=480, width=480)
dev.off()