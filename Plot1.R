## Plot 1
library(plyr)
library(dplyr)
library(lubridate)

plot1 <- function(){

## Read and filter the data
  t <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
  u <- mutate(t, datetime=as.POSIXct(paste(Date, Time), format="%d / %m / %Y %H:%M:%S"))
  v <- u[year(u$datetime)==2007 & month(u$datetime)==2 & (day(u$datetime)==1|day(u$datetime)==2),]  

## Plot the data and write the file
  png(filename = "plot1.png", width = 480, height = 480)  
  hist(v$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
  dev.off()

}