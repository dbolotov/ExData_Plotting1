# Coursera - Exploratory Data Analysis
# Course Project 1
# plot4.R

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
png(filename="plot3.png",width=480,height=480)
plot(data$DateTime,data$Sub_metering_1,type="l",col="black",
     xlab="", ylab="Energy sub metering")
lines(data$DateTime,data$Sub_metering_2,type="l",col="red")
lines(data$DateTime,data$Sub_metering_3,type="l",col="blue")

legend("topright", lty=c(1,1),col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
