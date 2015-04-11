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
png(filename = "plot2.png", 
     width = 480, height = 480,
     units = "px", bg = "transparent")
plot(newData$DateTime, newData$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()




