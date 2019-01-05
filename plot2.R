## read in total data and convert first column to date format
totaldata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
totaldata$Date <- as.Date(totaldata$Date, "%d/%m/%Y")

## subset data to only selected date range and remove NA
selectdata <- subset(totaldata, totaldata$Date >= as.Date("2007-2-1") & totaldata$Date <= as.Date("2007-2-2"))
selectdata <- na.omit(selectdata)

## add a combined date/time column
selectdata$datetime <- paste(selectdata$Date, selectdata$Time)
selectdata$datetime <- as.POSIXct(selectdata$datetime)

## plot 2
plot(selectdata$Global_active_power ~ selectdata$datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()

