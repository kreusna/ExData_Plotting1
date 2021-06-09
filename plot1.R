library("data.table")

# Reads in data from file
getData <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

# Change Date Column to Date Type
getData[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates from 2007-02-01 to 2007-02-02
getData <- getData[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

#Create image  
png("plot1.png", width=480, height=480)

# Create histogram plot
hist(getData[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Close plotting device
dev.off()