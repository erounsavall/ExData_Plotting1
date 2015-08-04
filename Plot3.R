## Plot 3
library(plyr)
library(dplyr)
library(lubridate)

plot3 <- function(){
  
## Read and filter the data
  t <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
  u <- mutate(t, datetime=as.POSIXct(paste(Date, Time), format="%d / %m / %Y %H:%M:%S"))
  v <- u[year(u$datetime)==2007 & month(u$datetime)==2 & (day(u$datetime)==1|day(u$datetime)==2),]  
  
## Plot the data and write the file
  png(filename = "plot3.png", width = 480, height = 480)       
  plot(v$datetime, v$Sub_metering_1, ylab = "Energy sub metering", xlab="", type="n")
    points(v$datetime, v$Sub_metering_1, type="l")
    points(v$datetime, v$Sub_metering_2, type="l", col="red")
    points(v$datetime, v$Sub_metering_3, type="l", col="blue")
  
    legend("topright", col=c("black", "red", "blue"), lty=1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

  dev.off()                   
}