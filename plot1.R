# Read the data file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Discard all rows that are not from the two relevant days
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Create histogram of Global Active Power
png("plot1.png")
hist(data$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.off()
