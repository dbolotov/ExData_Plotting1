# Coursera - Exploratory Data Analysis
# Course Project 1
# plot2.R

setwd("E:/documents/progr/ExData_Plotting1")

#load data
initial <- read.table("household_power_consumption.txt",
                      header=TRUE,sep=";",quote="",comment.char="",
                      nrows=100)

classes <- sapply(initial,class)

data <- read.table("household_power_consumption.txt",
                   header=FALSE,sep=";",quote="",na.strings="?",comment.char="",
                   colClasses = classes,skip = 66637,nrows=2880)

#preprocess
names(data) <- names(initial)

data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")


#create and save plot
plot(data$DateTime,data$Global_active_power,type="l",
     xlab="", ylab="Global Active Power (kilowatts)")



# with(data,plot(DateTime,Global_active_power))
plot(Global_active_power ~ DateTime,data)
lines(data$Global_active_power ~ data$DateTime)


