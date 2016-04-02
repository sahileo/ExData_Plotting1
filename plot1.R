##COURSERA: EXPLORATORY DATA ANALYSIS
#PROJECT 1:
#Assignment 1:

setwd(".\Coursera_EDA")

#Import data
  data <- read.csv("household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors = FALSE)
  head(data,2) #Check loaded data
  nrow(data) #2075259
  str(data)
#Subset data based on date
  data <- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))
  nrow(data) #2880
#Change class of date variable to 'date'
  data$Date <- as.Date(data$Date)
  class(data$Date) #Date
#Change class of 'Global_active_power' variable to numeric for plotting
  data$Global_active_power <- as.numeric(data$Global_active_power)
  class(data$Global_active_power) #Numeric
#Plot and save as png file
  hist(data$Global_active_power, col="red", main = "Global Active Power", ylab="Frequency",xlab="Global Active Power (kilowatts)")
  dev.copy(png, "plot1.png", width=480, height=480)
  dev.off()
