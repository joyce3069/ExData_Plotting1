#Read data into table
tbl <- read.table("household_power_consumption.txt", dec = ".", stringsAsFactors = FALSE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), header = TRUE, sep = ";", na.strings = "?")
#Subset data
Feb2007 <- subset(tbl, Date == "1/2/2007"| Date == "2/2/2007")
#Format date and time
Feb2007$Date <- as.Date(Feb2007$Date, format = "%d/%m/%Y")
datetime <- paste(Feb2007$Date, Feb2007$Time)
Feb2007$datetime <- as.POSIXct(datetime)
#Create plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
#Top-Left
with(Feb2007, plot(Global_active_power~datetime, type="l", ylab ="Global Active Power", xlab= ""))
#Top-Right
with(Feb2007, plot(Voltage~datetime, type="l", ylab ="Voltage", xlab= "datetime"))
#Bottom_Left
with(Feb2007, plot(x=datetime, y=Sub_metering_1, type="l", col = "black", xlab="", ylab="Enegy sub metering"))
lines(x=Feb2007$datetime, y=Feb2007$Sub_metering_2, type="l", col = "red")
lines(x=Feb2007$datetime, y=Feb2007$Sub_metering_3, type="l", col = "blue")
legend("topright",bty="n", lty=1, col= c("black", "red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metring_3"), cex=0.5)
#Bottom-Right
with(Feb2007, plot(Global_reactive_power~datetime, type="l", ylab ="Global_reactive_power", xlab= "datetime"))
dev.copy(png, file = "plot4.png", height = 480, width =480)
dev.off()