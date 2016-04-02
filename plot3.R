##COURSERA: EXPLORATORY DATA ANALYSIS
#PROJECT 1:
#Assignment 3:

setwd(".\Coursera_EDA")

#Import data  
  data <- read.csv("household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors = FALSE)
  head(data,2) #Check loaded data
  nrow(data) #2075259
  str(data)
#Subset data based on date
  data <- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))
  nrow(data) #2880
#Create a new variable datetime
  data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#Change class of variables Sub_metering_1, Sub_metering_2, Sub_metering_3 to numeric for plotting
  data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
  data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
  data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
#Plot and save as png file
  png("plot3.png",width=480,height=480)
  plot(data$datetime, data$Sub_metering_1, type="l",ylab="Energy Sub metering",xlab="")
  lines(data$datetime,data$Sub_metering_2, type="l",col="red")
  lines(data$datetime,data$Sub_metering_3, type="l",col="blue")
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,lwd=1,col=c("black","red","blue"))
  dev.off()


