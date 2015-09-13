#Load the entire data file
#EPC - Electric Power Consumption
epc.data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = "character")

#Convert the data in the first column to dates
epc.data$Date <- as.Date(epc.data$Date, "%d/%m/%Y")

#Subset the data to extract the rows for Feb 1, 2007 and Feb 2, 2007
feb.data <- epc.data[(epc.data$Date >= as.Date("2007-02-01")&epc.data$Date <= as.Date("2007-02-02")),]

feb.data$Global_active_power <- as.numeric(feb.data$Global_active_power)

png(file="plot1.png")
hist(feb.data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.off()
