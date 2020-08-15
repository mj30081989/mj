library(dplyr)
library(lubridate)

df<- read.csv("household_power_consumption.txt", sep = ";")     
df <- df %>% 
  filter(Date == "1/2/2007"|Date == "2/2/2007") %>%       
  mutate(time = paste(Date, Time, sep = ".")) %>%        
  select(10,3:5,7:9)                                    

df$time <- dmy_hms(df$time)                                    

for (i in seq(5)) {                                            
  df[[i+1]] <- as.numeric(df[[i+1]])
}

png("plot4.png")                                              
par(mfrow = c(2,2))                                             

with(df, plot(time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))
# plot the first plot, i.e. the topleft plot 
with(df, plot(time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
# plot the second plot, i.e. the topright plot 
with(df, plot(time, Sub_metering_1, type = "l", xlab = "", ylab = "Engergy sub metering"))
lines(df$time, df$Sub_metering_2, col = "red")
lines(df$time, df$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lwd = "1",col = c("black", "red", "blue"))
# plot the third plot, i.e. the buttomleft plot
with(df, plot(time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))


dev.off()        