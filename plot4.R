library("data.table")

#Reads in data from file
getData <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

# Making a POSIXct date for filter
getData[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates from 2007-02-01 to 2007-02-02
getData <- getData[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

# Create image
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# Create Plot 1
plot(getData[, dateTime], getData[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

# Create Plot 2
plot(getData[, dateTime],getData[, Voltage], type="l", xlab="datetime", ylab="Voltage")

# Create Plot 3
plot(getData[, dateTime], getData[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(getData[, dateTime], getData[, Sub_metering_2], col="red")
lines(getData[, dateTime], getData[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "), lty=c(1,1)
       , bty="n", cex=.5) 

# Create plot 4
plot(getData[, dateTime], getData[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

#Close plotting device
dev.off()