# Coursera - Exploratory Data Analysis
# Course Project 1
# plot1.R

setwd("E:/documents/progr/ExData_Plotting1")

#load data
initial <- read.table("household_power_consumption.txt",
                      header=TRUE,sep=";",quote="",comment.char="",
                      nrows=100)

classes <- sapply(initial,class) #get class for each column

data <- read.table("household_power_consumption.txt",
                   header=FALSE,sep=";",quote="",na.strings="?",comment.char="",
                   colClasses = classes,skip = 66637,nrows=2880)

#preprocess
names(data) <- names(initial)

data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#create and save plot
png(filename="plot1.png",width=480,height=480)
hist(data$Global_active_power,
      col="red",main="Global Active Power",
      xlab="Global Active Power (kilowatts)",ylab="Frequency")

dev.off()

