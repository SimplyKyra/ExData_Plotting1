# Creates the first plot for the Coursera - Exploratory  Data Analysis - Course Project 1 

# Assuming your file location contains the unzipped data folder containing the proper text file
txtFileLocation <- "./exdata-data-household_power_consumption/household_power_consumption.txt"

data <- read.table(txtFileLocation, header = TRUE, sep = ";", stringsAsFactors = F)

# subset the data to just be the two days in February
data <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

# Create new column containing the date and time
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Cast the Global Active Power column to numeric
data$Global_active_power <- as.numeric(data$Global_active_power) 

# Create the first plot png file
png('plot1.png')

# Create the histogram for the png 
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Close it off
dev.off()

