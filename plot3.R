#Load the entire data file
#EPC - Electric Power Consumption
epc.data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = "character")

#Convert the data in the first 2 columns to datetime format.
dttm <- paste(epc.data$Date, epc.data$Time)
epc.dttm <- strptime(dttm, "%d/%m/%Y %H:%M:%S")

#Convert the data in the first column to dates
epc.data$Date <- as.Date(epc.data$Date, "%d/%m/%Y")

#Add the datetime column to the EPC data
epc.data <- cbind(epc.dttm, epc.data)
colnames(epc.data)[1] <- "DateTime"

#Subset the data to extract the rows for Feb 1, 2007 and Feb 2, 2007
feb.data <- epc.data[(epc.data$Date >= as.Date("2007-02-01")&epc.data$Date <= as.Date("2007-02-02")),]

feb.data$Sub_metering_1 <- as.numeric(feb.data$Sub_metering_1)
feb.data$Sub_metering_2 <- as.numeric(feb.data$Sub_metering_2)
feb.data$Sub_metering_3 <- as.numeric(feb.data$Sub_metering_3)

png(file="plot3.png")
plot(feb.data$DateTime, feb.data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(feb.data$DateTime, feb.data$Sub_metering_2, col = "red")
lines(feb.data$DateTime, feb.data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c(1,2,4), lty = c(1,1,1))
dev.off()
