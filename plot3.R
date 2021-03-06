## read in total data and convert first column to date format
totaldata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
totaldata$Date <- as.Date(totaldata$Date, "%d/%m/%Y")

## subset data to only selected date range and remove NA
selectdata <- subset(totaldata, totaldata$Date >= as.Date("2007-2-1") & totaldata$Date <= as.Date("2007-2-2"))
selectdata <- na.omit(selectdata)

## add a combined date/time column
selectdata$datetime <- paste(selectdata$Date, selectdata$Time)
selectdata$datetime <- as.POSIXct(selectdata$datetime)

## plot 3
with(selectdata, plot(Sub_metering_1 ~ datetime, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
lines(selectdata$Sub_metering_2 ~ selectdata$datetime, col='Red')
lines(selectdata$Sub_metering_3 ~ selectdata$datetime, col='Blue')
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1),     c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()

