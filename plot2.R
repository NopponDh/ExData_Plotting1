## Read file into R
data_file <- "./household_power_consumption.txt"
data <- read.table(data_file, header = TRUE, 
                   sep = ";", stringsAsFactors = FALSE, 
                   dec = ".", na.strings = "?")
subset_data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

## Using strptime()
date_time <- strptime(paste(subset_data$Date, subset_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
global_active_power <- as.numeric(subset_data$Global_active_power)
png("plot2.png", width=480, height=480)
plot(date_time, global_active_power, type = "l", 
     xlab ="", ylab = "Global Active Power (kilowatts)")
dev.off()
