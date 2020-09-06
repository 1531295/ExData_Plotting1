# read in dataset
complete_data <- read.table("household_power_consumption.txt", 
                            sep = ";", na.strings = "?", header = T)

# subset the data
data <- subset(complete_data, Date == "1/2/2007" | Date == "2/2/2007")

# format date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")


# create datetime column
data$datetime <- strptime(paste(data$Date,data$Time), format = "%Y-%m-%d %H:%M:%S")

# make the second plot
png(filename = "plot2.png")
with(data, plot(datetime, Global_active_power, type = "n",
                ylab = "Global Active Power (kilowatts)", xlab = " "
))
with(data,lines(datetime, Global_active_power))
dev.off()





