library(data.table)
setwd("D:/Coursera/testing")

dt <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
sub_dt <- subset(dt,dt$Date=="1/2/2007" | dt$Date =="2/2/2007")

datetime <- strptime(paste(sub_dt$Date, sub_dt$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(sub_dt$Global_active_power)
subMetering1 <- as.numeric(sub_dt$Sub_metering_1)
subMetering2 <- as.numeric(sub_dt$Sub_metering_2)
subMetering3 <- as.numeric(sub_dt$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
