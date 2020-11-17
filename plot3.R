dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
data1 <- as.numeric(data$Sub_metering_1)
data2 <- as.numeric(data$Sub_metering_2)
data3 <- as.numeric(data$Sub_metering_3)

png("plot3.png")
plot(datetime, data1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, data2, type="l", col="red")
lines(datetime, data3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()