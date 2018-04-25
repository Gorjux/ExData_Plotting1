##set directory and read data
setwd("../")
##Electric_power<-read.csv('~/Data Science/assignment5/household_power_consumption.txt', header=T, sep=";", na.strings="?")



##Converted the column "Date" in a date format
Electric_power$Date<-as.Date(Electric_power$Date, format="%d/%m/%Y")



##Extracted the data we will use 
Subset_Electric_power<-subset(Electric_power,subset=(Date=="2007-02-01"|Date=="2007-02-02"))

##Created a new column which contains the complet date on the shape "%Y-%m-%d %H:%M:%S"
Subset_Electric_power$Completdate<-strptime(paste(Subset_Electric_power$Date, 
                                                  Subset_Electric_power$Time), format="%Y-%m-%d %H:%M:%S")


##Multiple base plot
par(mfrow=c(2,2), mar=c(3, 4, 3, 1))

with(Subset_Electric_power,{
  ##Plot2
    plot(Completdate, Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)")
  
  ##Plot voltage
  plot(Completdate, Voltage, type="l",  xlab="datetime")
  
  ##Plot3
  plot(x=Completdate, y=Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
  lines(x=Completdate, y=Sub_metering_2, col="red")
  lines(x=Completdate, y=Sub_metering_3, col="blue")
  legend("topright",lty=1,col=c("Black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  ##Plot Global reactive power
  plot(Completdate, Global_reactive_power, type="l", xlab="datetime")
                          })

##Copy plot4 to a PNG file
dev.copy(png,file="plot4.png", height=480, width=480)
dev.off()