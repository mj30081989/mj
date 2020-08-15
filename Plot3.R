data2 <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
d1<- as.Date("01/02/2007", "%d/%m/%Y")
d2<- as.Date("02/02/2007", "%d/%m/%Y")
subset(data2, (as.Date(data2$Date, "%d/%m/%Y") == d1)|(as.Date(data2$Date, "%d/%m/%Y") == d2)) -> data3 

data3$Date <- as.Date(data3$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data3$Date), data3$Time)
data3$Datetime <- as.POSIXct(datetime)

with(data3,{
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, "plot3.png")
dev.off