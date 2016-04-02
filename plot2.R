##COURSERA: EXPLORATORY DATA ANALYSIS
#PROJECT 1:
#Assignment 2:

setwd("C:\\Users\\Sahil\\Desktop\\Coursera_EDA")

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
#Plot and save as png file
  plot(data$datetime, data$Global_active_power, type="l",ylab= "Global Active Power (Kilowatts)", xlab="")
  dev.copy(png, "plot2.png", width=480, height=480)
  dev.off()