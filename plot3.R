download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
unzip("household_power_consumption.zip")
library(sqldf)

x<-read.csv.sql("household_power_consumption.txt", sql="select * from file where Date in ('1/2/2007','2/2/2007')", sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
x$DateTime <- as.POSIXct(paste(x$Date,x$Time), format = "%e/%m/%Y %X")

png(filename="plot3.png")
plot(x=x$DateTime, y=x$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x=x$DateTime, y=x$Sub_metering_2, col="red")
lines(x=x$DateTime, y=x$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),   col = c("black", "red", "blue"), lty = 1)
dev.off()