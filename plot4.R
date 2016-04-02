##COURSERA: EXPLORATORY DATA ANALYSIS
#PROJECT 1:
#Assignment 4: 

setwd(".\Coursera_EDA")

#Import data  
  data <- read.csv("household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors = FALSE)
  head(data,2)
  nrow(data) #2075259
  str(data)
#Subset data based on date
  data <- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))
  nrow(data) #2880
#Create a variable datetime
  data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#Change class of varaiables for plotting
  data$Global_active_power <- as.numeric(data$Global_active_power)
  data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
  data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
  data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
  data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
  data$Voltage <- as.numeric(data$Voltage)
#Plot and save as png file
  png("plot4.png",width=480,height=480)
  par(mfrow=c(2,2))
  #Plot No.1 (topleft)
  plot(data$datetime, data$Global_active_power,ylab="Global Active Power",xlab="",type="l")
  #Plot No.2 (topright)
  plot(data$datetime, data$Voltage, type="l",xlab="datetime",ylab="Voltage")
  #Plot No.3 (bottomleft)
  plot(data$datetime, data$Sub_metering_1, type="l",ylab="Energy Sub metering",xlab="")
  lines(data$datetime,data$Sub_metering_2, type="l",col="red")
  lines(data$datetime,data$Sub_metering_3, type="l",col="blue")
  legend("topright",legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black","red","blue"),bty="n")
  #Plot No.4 (bottomright)
  plot(data$datetime, data$Global_reactive_power, type="l",xlab="datetime",ylab="Global_reactive_power")
  dev.off()