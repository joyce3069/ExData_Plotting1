#Read data into table
tbl <- read.table("household_power_consumption.txt", dec = ".", stringsAsFactors = FALSE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), header = TRUE, sep = ";", na.strings = "?")
#Subset data
Feb2007 <- subset(tbl, Date == "1/2/2007"| Date == "2/2/2007")
head(Feb2007)
summary(Feb2007)
#Create Plot1
hist(Feb2007$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", ylim = c(0, 1200), xlim = c(0, 6), breaks = 12)
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()