#Read data into table
tbl <- read.table("household_power_consumption.txt", dec = ".", stringsAsFactors = FALSE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), header = TRUE, sep = ";", na.strings = "?")
#Subset data
Feb2007 <- subset(tbl, Date == "1/2/2007"| Date == "2/2/2007")
#Format date and time
Feb2007$Date <- as.Date(Feb2007$Date, format = "%d/%m/%Y")
datetime <- paste(Feb2007$Date, Feb2007$Time)
Feb2007$datetime <- as.POSIXct(datetime)
#Create plot2
plot(x=Feb2007$datetime, y=Feb2007$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = " ")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()