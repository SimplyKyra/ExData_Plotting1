# Creates the fourth plot for the Coursera - Exploratory  Data Analysis - Course Project 1 

# Assuming your file location contains the unzipped data folder containing the proper text file
txtFileLocation <- "./exdata-data-household_power_consumption/household_power_consumption.txt"

data <- read.table(txtFileLocation, header = TRUE, sep = ";", stringsAsFactors = F)

# subset the data to just be the two days in February
data <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

# Create new column containing the date and time
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Cast the Global Active Power column to numeric
data$Global_active_power <- as.numeric(data$Global_active_power) 

# Create the second plot png file
png('plot4.png')

# Create the scatterplot with lines for the png 
par(mfrow = c(2, 2), mar = c(5, 4, 2, 1))
# First Grid
with(data, plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
# Second Grid
with(data, plot(data$DateTime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime"))
# Third Grid 
with(data, plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col="black"))
points(data$DateTime, data$Sub_metering_2, type = "l", col="red")
points(data$DateTime, data$Sub_metering_3, type = "l", col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c('black', 'red', 'blue'), cex=.75) #, fill = NULL, border = "black"))
# Fourth Grid
with(data, plot(data$DateTime, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime"))

# Close it off
dev.off()
