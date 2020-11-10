library(data.table)
setwd("D:/Coursera/testing")

dt <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
sub_dt <- subset(dt,dt$Date=="1/2/2007" | dt$Date =="2/2/2007")

datetime <- strptime(paste(sub_dt$Date, sub_dt$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(sub_dt$Global_active_power)

png("plot2.png", width=480, height=480)

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
