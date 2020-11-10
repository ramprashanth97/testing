library(data.table)
setwd("D:/Coursera/testing")

dt <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
sub_dt <- subset(dt,dt$Date=="1/2/2007" | dt$Date =="2/2/2007")

png("plot1.png",width = 480,height = 480)

hist(as.numeric(as.character(sub_dt$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

dev.off()