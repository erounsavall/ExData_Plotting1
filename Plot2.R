## Plot 2
library(plyr)
library(dplyr)
library(lubridate)

plot2 <- function(){
  
## Read and filter the data
  t <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
  u <- mutate(t, datetime=as.POSIXct(paste(Date, Time), format="%d / %m / %Y %H:%M:%S"))
  v <- u[year(u$datetime)==2007 & month(u$datetime)==2 & (day(u$datetime)==1|day(u$datetime)==2),]  
  
## Plot the data and write the file
  png(filename = "plot2.png", width = 480, height = 480)  
  plot(v$datetime, v$Global_active_power, xlab="", ylab = "Global Active Power (kilowatts)", type="n")
  points(v$datetime, v$Global_active_power, type="l")
  dev.off()
  
}