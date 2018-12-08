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

png("plot3.png", width=480, height=480)
plot(date_time, subset_data$Sub_metering_1, type = "l",
         ylab = "Global Active Power (kilowatts)", xlab = "")
    lines(date_time, subset_data$Sub_metering_2, type = "l", col = "Red")
    lines(date_time, subset_data$Sub_metering_3, type = "l", col = "Blue")

legend("topright", col = c("black", "red", "blue"), lwd = c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
