data2 <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
d1<- as.Date("01/02/2007", "%d/%m/%Y")
d2<- as.Date("02/02/2007", "%d/%m/%Y")
subset(data2, (as.Date(data2$Date, "%d/%m/%Y") == d1)|(as.Date(data2$Date, "%d/%m/%Y") == d2)) -> data3 

data3$Date <- as.Date(data3$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data3$Date), data3$Time)
data3$Datetime <- as.POSIXct(datetime)

with(data3, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
dev.copy(png, "plot2.png")
dev.off