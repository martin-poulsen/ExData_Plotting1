# Read the data file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Discard all rows that are not from the two relevant days
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Convert the time field to the appropriate data type
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Create line diagram of Energy sub metering 1 - 3
png("plot3.png")

# First set the language to english, then create an empty plot area
Sys.setlocale("LC_ALL","English")
with(data, plot(Time, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering", xlim = as.POSIXct(c("2007-02-01 00:00:00","2007-02-03 00:00:00"))))

# Then add the lines
with(data, lines(Time, Sub_metering_1, col = "black"))
with(data, lines(Time, Sub_metering_2, col = "red"))
with(data, lines(Time, Sub_metering_3, col = "blue"))

# Also add a legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

# Close the file
dev.off()
