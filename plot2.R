# Read the data file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Discard all rows that are not from the two relevant days
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Convert the time field to the appropriate data type
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Create line diagram of Global Active Power
png("plot2.png")

# First set the language to english, then create an empty plot area
Sys.setlocale("LC_ALL","English")
with(data, plot(Time, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)", xlim = as.POSIXct(c("2007-02-01 00:00:00","2007-02-03 00:00:00"))))

# Then add the lines
with(data, lines(Time, Global_active_power))

# Close the file
dev.off()
