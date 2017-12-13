getwd()

# Reading the data into R
library(data.table)
powerDT <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

# Changing the variable to numeric
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Changing date column to date type (.SD is used to subset the data)
powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Subsetting data belonging to 2007-02-02 & 2007-02-02
powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

# Creating the graph device
png("plot1.png", width=480, height=480)

#Creating the Graph
hist(powerDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()