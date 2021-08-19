#Read data into table
tbl <- read.table("household_power_consumption.txt", dec = ".", stringsAsFactors = FALSE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), header = TRUE, sep = ";", na.strings = "?")
#Subset data
Feb2007 <- subset(tbl, Date == "1/2/2007"| Date == "2/2/2007")
#Format date and time
Feb2007$Date <- as.Date(Feb2007$Date, format = "%d/%m/%Y")
datetime <- paste(Feb2007$Date, Feb2007$Time)
Feb2007$datetime <- as.POSIXct(datetime)
#Create plot3
with(Feb2007, plot(x=datetime, y=Sub_metering_1, type="l", col = "black", xlab="", ylab="Enegy sub metering"))
lines(x=Feb2007$datetime, y=Feb2007$Sub_metering_2, type="l", col = "red")
lines(x=Feb2007$datetime, y=Feb2007$Sub_metering_3, type="l", col = "blue")
legend("topright", lty=1, col= c("black", "red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metring_3"), cex=0.3)
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
