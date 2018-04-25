##set directory and read data
setwd("../")
Electric_power<-read.csv('~/github/assignment5/household_power_consumption.txt', header=T, sep=";", na.strings="?")


##convert the column "Date" in a date format
Electric_power$Date<-as.Date(Electric_power$Date, format="%d/%m/%Y")


##Extract the data we will use 
Subset_Electric_power<-subset(Electric_power,subset=(Date=="2007-02-01"|Date=="2007-02-02"))


##Plot1
with(Subset_Electric_power, hist(Global_active_power,col="red",xlab="Global active power (kilowatts)", main="Global Active Power"))

