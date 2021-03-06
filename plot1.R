# Read data into data frame
# 
# Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3
# 16/12/2006;17:24:00;4.216;0.418;234.840;18.400;0.000;1.000;17.000

data <- read.delim('household_power_consumption.txt', sep = ';', na.strings = '?')
# Convert the date to dateclass
data$Date <- as.Date(data$Date, "%d/%m/%Y")
#subset data based on date
data <- data[(data$Date == "2007-02-01")|(data$Date == "2007-02-02"),]
# Convert the time to time class
data$Time <- strptime(data$Time, "%H:%M:%S")

png(file = "plot1.png", width = 480, height = 480) 
## Create plot and send to a file (no plot appears on screen)
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (killowats)", col = "red")
dev.off() ## Close the png file device
