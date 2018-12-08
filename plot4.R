## Read file into R
data_file <- "./household_power_consumption.txt"
data <- read.table(data_file, header = TRUE, 
                   sep = ";", stringsAsFactors = FALSE, 
                   dec = ".", na.strings = "?")
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

date_time <- strptime(paste(subset_data$Date, subset_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
global_active_power <- as.numeric(subset_data$Global_active_power)
subset_data$Sub_metering_1 <- as.numeric(subset_data$Sub_metering_1)
subset_data$Sub_metering_2 <- as.numeric(subset_data$Sub_metering_2)
subset_data$Sub_metering_3 <- as.numeric(subset_data$Sub_metering_3)

global_reactive_power <- as.numeric(subset_data$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)

## Open graphic device
png("plot4.png", width = 480, height = 480)

## Set area for plotting 4 graph
par(mfrow = c(2, 2))

## graph_1
plot(date_time, global_active_power, 
     type = "l", xlab = "", ylab = "Global Active Power")

## graph_2
plot(date_time, voltage, 
     type="l", xlab = "datetime", ylab = "Voltage")

## graph_3
plot(date_time, subset_data$Sub_metering_1, 
     type = "l", ylab = "Energy Submetering", xlab = "")
lines(date_time, subset_data$Sub_metering_2, 
      type="l", col="red")
lines(date_time, subset_data$Sub_metering_3, 
      type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, lwd = 2.5, col = c("black", "red", "blue"), bty = "n")

## graph_4
plot(date_time, global_reactive_power, 
     type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()