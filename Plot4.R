## Plot 4
library(plyr)
library(dplyr)
library(lubridate)

plot4 <- function(){
  
## Read and filter the data
  t <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
  u <- mutate(t, datetime=as.POSIXct(paste(Date, Time), format="%d / %m / %Y %H:%M:%S"))
  v <- u[year(u$datetime)==2007 & month(u$datetime)==2 & (day(u$datetime)==1|day(u$datetime)==2),]  
  
## Plot the data and write the file
  png(filename = "plot4.png", width = 480, height = 480)    
  par(mfcol=c(2,2), mar=c(4,4,2,2))
  
    ## upper left: see plot 2
    plot(v$datetime, v$Global_active_power, xlab="", ylab = "Global Active Power (kilowatts)", type="n")
    points(v$datetime, v$Global_active_power, type="l")
    
    ## lower left: see plot 3
    plot(v$datetime, v$Sub_metering_1, xlab="", ylab = "Energy sub metering", type="n")
    points(v$datetime, v$Sub_metering_1, type="l")
    points(v$datetime, v$Sub_metering_2, type="l", col="red")
    points(v$datetime, v$Sub_metering_3, type="l", col="blue")
    legend("topright", col=c("black", "red", "blue"), lty=1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    ## upper right: new plot
    plot(v$datetime, v$Voltage, ylab = "Voltage", xlab="datetime",type="n")
    points(v$datetime, v$Voltage, type="l")
    
    ## lower right: new plot
    plot(v$datetime, v$Global_reactive_power, ylab = "Global_reactive_power", xlab="datetime",type="n")
    points(v$datetime, v$Global_reactive_power, type="l")
    
  dev.off()

}