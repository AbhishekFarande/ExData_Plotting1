filename <- "household_power_consumption.txt"
data <- read.table(filename,
                    header = TRUE,
                    sep = ";",
                    colClasses = c("character", "character", rep("numeric",7)),
                    na = "?")
subset <- data$Date == "1/2/2007" | data$Date == "2/2/2007"
newData <- data[subset, ]
x <- paste(newData$Date, newData$Time)
newData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(newData) <- 1:nrow(newData)
png(filename = "plot4.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
par(mfrow = c(2, 2))
## Top-left
plot(newData$DateTime, newData$Global_active_power, 
     type = "l",
     xlab = "", ylab = "Global Active Power")
## Top-right
plot(newData$DateTime, newData$Voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage")
## Bottom-left
plot(newData$DateTime, newData$Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(newData$DateTime, newData$Sub_metering_2, col = "red")
lines(newData$DateTime, newData$Sub_metering_3, col = "blue")
# Remove the border of legend here.
legend("topright", 
       bty = "n",
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
## Bottom-right
plot(newData$DateTime, newData$Global_reactive_power, 
     type = "l",
     col = "black",
     xlab = "datetime", ylab = colnames(newData)[4])
dev.off()




