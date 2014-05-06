# Coursera - Exploratory Data Analysis
# Course Project 1
# plot2.R

setwd("E:/documents/progr/ExData_Plotting1")

#load data
initial <- read.table("household_power_consumption.txt",
                      header=TRUE,sep=";",quote="",comment.char="",
                      nrows=100)

classes <- sapply(initial,class)

ptm <- proc.time()
data <- read.table("household_power_consumption.txt",
                   header=FALSE,sep=";",quote="",na.strings="?",comment.char="",
                   colClasses = classes,skip = 66637,nrows=2880)
proc.time() - ptm

#preprocess
names(data) <- names(initial)

data$DateTime <- paste(data$Date,data$Time)
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")