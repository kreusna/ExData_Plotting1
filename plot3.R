library("data.table")

#Reads in data from file
getData <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

# Making a POSIXct date for filter
getData[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Date from 2007-02-01 to 2007-02-02
getData <- getData[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#Create image
png("plot3.png", width=480, height=480)

# Create plot
plot(getData[, dateTime], getData[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(getData[, dateTime], getData[, Sub_metering_2],col="red")
lines(getData[, dateTime], getData[, Sub_metering_3],col="blue")
legend("topright" , col=c("black","red","blue") , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

#Close plotting device
dev.off()