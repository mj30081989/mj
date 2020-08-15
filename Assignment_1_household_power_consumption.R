dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec=".")
subsetdata <- subset(data, Date== "1/2/2007"| Date=="2/2/2007")


globalActivePower <- as.numeric(subsetdata$Global_active_power)
png("plot 1.png", width = 480, height = 480)
hist(globalActivePower, col="red", main = "Global Active Power",xlab = "Global Active Power (kilowatt)")
dev.off()

data <- read.table(dataFile, header=TRUE, sep=";",stringsAsFactors = FALSE)
subsetdata <- subset(data, Date == "1/2/2007"|Date =="2/2/2007")

#str(subSetData)
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subsetdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

readdata <- "household_power_consumption.txt"
data <- read.table(readdata, header=TRUE, sep= ";")
subsetdata <- subset(data, Date=="1/2/2007"|Date=="2/2/2007")


subsetdata <- transform(subsetdata, Sub_metering_1=as.numeric(as.character(Sub_metering_1)))
subsetdata <- transform(subsetdata, Sub_matering_2=as.numeric(as.character(Sub_metering_2)))
subsetdata <- transform(subsetdata, Sub_matering_3=as.numeric(as.character(Sub_metering_3)))


subsetdata$DateTime <- paste(subsetdata$Date, subsetdata$Time, sep=" ")


subsetdata$DateTime <- strptime(subsetdata$DateTime, "%d/%m/%Y %H:%M:%S")

png(file="plot3.png", height = 480, width = 480)


plot(subsetdata$DateTime, subsetdata$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab = "")
lines(subsetdata$DateTime, subsetdata$Sub_metering_2, type = "l", col="red")
lines(subsetdata$DateTime, subsetdata$Sub_metering_3, type="l", col="blue")


legend("topright",col=c("black","red","blue"), lty = 1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()

rdata <- "household_power_consumption.txt"
data <- read.table(rdata, header = TRUE, sep=";")
subsetdata <- subset(data, Date== "1/2/2007"| Date=="2/2/2007")


datetime <- strptime(paste(subsetdata$Date,subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subsetdata$Global_active_power)
globalReactivePower <- as.numeric(subsetdata$Global_reactive_power)
voltage <- as.numeric(subsetdata$Voltage)
subMetering1 <- as.numeric(subsetdata$Sub_metering_1)
subMetering2 <- as.numeric(subsetdata$Sub_metering_2)
subMetering3 <- as.numeric(subsetdata$Sub_metering_3)

png(file="plot4.png")
par(mfrow=c(2,2))

plot(datetime,globalActivePower, type="l",xlab="",ylab="Global Active Power")
plot(datetime,voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type = "l", ylab="Energy sub metering", xlab = "")
lines(datetime, subMetering2, type = "l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", col=c("black","red","blue"), lty=1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(datetime,globalReactivePower, type="l", ylab = "Global_reactive_power", xlab="datetime")

dev.off()
