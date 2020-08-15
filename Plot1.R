data2 <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
d1<- as.Date("01/02/2007", "%d/%m/%Y")
d2<- as.Date("02/02/2007", "%d/%m/%Y")
subset(data2, (as.Date(data2$Date, "%d/%m/%Y") == d1)|(as.Date(data2$Date, "%d/%m/%Y") == d2)) -> data3 
hist(as.numeric(data3$Global_active_power), col = "red", xlab = "Global Active power (KW)",main = "Global Active Power")
dev.copy(png, "plot1.png")
dev.off