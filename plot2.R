download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
unzip("household_power_consumption.zip")
library(sqldf)

x<-read.csv.sql("household_power_consumption.txt", sql="select * from file where Date in ('1/2/2007','2/2/2007')", sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
x$DateTime <- as.POSIXct(paste(x$Date,x$Time), format = "%e/%m/%Y %X")

png(filename="plot2.png")
plot(x=x$DateTime, y=x$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()