library("data.table")

#Reads in data from file
getData <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?")

# Making a POSIXct date for filter
getData[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates from 2007-02-01 to 2007-02-02
getData <- getData[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#Create image
png("plot2.png", width=480, height=480)

#Create plot
plot(x = getData[, dateTime]
     , y = getData[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Close plotting device
dev.off()