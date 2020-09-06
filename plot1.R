# read in dataset
complete_data <- read.table("household_power_consumption.txt", 
                            sep = ";", na.strings = "?", header = T)

# subset the data
data <- subset(complete_data, Date == "1/2/2007" | Date == "2/2/2007")

# format date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# make the first plot
png(filename = "plot1.png")
hist(data$Global_active_power, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency"
)
dev.off()




