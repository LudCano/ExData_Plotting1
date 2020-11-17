
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
data1 <- as.numeric(data$Sub_metering_1)
data2 <- as.numeric(data$Sub_metering_2)
data3 <- as.numeric(data$Sub_metering_3)
GAP <- as.numeric(data$Global_active_power)
voltage <- as.numeric(data$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, data1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, data2, type="l", col="red")
lines(datetime, data3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, GAP, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()