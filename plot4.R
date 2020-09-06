# read in dataset
complete_data <- read.table("household_power_consumption.txt", 
                            sep = ";", na.strings = "?", header = T)

# subset the data
data <- subset(complete_data, Date == "1/2/2007" | Date == "2/2/2007")

# format date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")


# create datetime column
data$datetime <- strptime(paste(data$Date,data$Time), format = "%Y-%m-%d %H:%M:%S")

# create plot framework
png(filename = "plot4.png")
# four plots altogether
par(mfrow = c(2,2), mar = c(4,4,2,2))

# first plot
with(data, plot(datetime, Global_active_power, type = "n",
                ylab = "Global Active Power (kilowatts)", xlab = " "
))
with(data,lines(datetime, Global_active_power))

# second plot
with(data, plot(datetime, Voltage, type = "n",
                ylab = "Voltage", xlab = "datetime"
))
with(data,lines(datetime, Voltage))

#third plot
with(data, plot(datetime, Sub_metering_1, type = "n",
                ylab = "Energy sub metering", xlab = " "
))
with(data,lines(datetime, Sub_metering_1, col = "black"))
with(data,lines(datetime,Sub_metering_2, col = "red"))
with(data,lines(datetime,Sub_metering_3, col = "blue"))

#add legend
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2",
                                  "Sub_metering_3"), col = c("black","red","blue"),
       lwd = 1, lty = c(1,1,1),xjust = 2, bty = "n")

#fourth plot
with(data, plot(datetime, Global_reactive_power, type = "n"))
with(data,lines(datetime, Global_reactive_power))

dev.off()
