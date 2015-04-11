filename <- "household_power_consumption.txt"
data <- read.table(filename,
                    header = TRUE,
                    sep = ";",
                    colClasses = c("character", "character", rep("numeric",7)),
                    na = "?")
subset <- data$Date == "1/2/2007" | data$Date == "2/2/2007"
newData <- data[subset, ]
x <- paste(data$Date, data$Time)
newData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(newData) <- 1:nrow(newData)
png(filename = "plot1.png",   width = 480, height = 480, units = "px", bg = "transparent")
hist(newData$Global_active_power, col = "red",  main = "Global Active Power",  xlab = "Global Active Power (kilowatts)", breaks = 12, ylim = c(0, 1200))
dev.off()
