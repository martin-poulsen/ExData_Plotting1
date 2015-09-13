# Read the data file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Discard all rows that are not from the two relevant days
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Convert the time field to the appropriate data type
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Set the language to english
Sys.setlocale("LC_ALL","English")

# Create four line diagrams arranged in two rows
png("plot4.png")
par(mfrow = c(2, 2))

# Global Active Power
with(data, plot(Time, Global_active_power, type = "n", ylab = "Global Active Power", xlab = "", 
                xlim = as.POSIXct(c("2007-02-01 00:00:00","2007-02-03 00:00:00"))))

with(data, lines(Time, Global_active_power))

# Voltage
with(data, plot(Time, Voltage, type = "n", ylab = "Voltage", xlab = "datetime", 
                xlim = as.POSIXct(c("2007-02-01 00:00:00","2007-02-03 00:00:00"))))

with(data, lines(Time, Voltage))

# Energy sub metering
with(data, plot(Time, Sub_metering_1, type = "n", xlab = "", 
                ylab = "Energy sub metering", 
                xlim = as.POSIXct(c("2007-02-01 00:00:00","2007-02-03 00:00:00"))))

with(data, lines(Time, Sub_metering_1, col = "black"))
with(data, lines(Time, Sub_metering_2, col = "red"))
with(data, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"), bty = "n")

# Global Reactive Power
with(data, plot(Time, Global_reactive_power, type = "n", ylab = "Global Reactive Power", 
                xlab = "datetime", 
                xlim = as.POSIXct(c("2007-02-01 00:00:00","2007-02-03 00:00:00"))))

with(data, lines(Time, Global_reactive_power))

# Close the file
dev.off()
