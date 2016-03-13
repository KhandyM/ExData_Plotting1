library(data.table)
library(dplyr)

filePath <- "C:/Users/khandizwe/Desktop/Coursera/EDA/Week1/ExData_Plotting1"
setwd(filePath)
if(!file.exists("./data")){dir.create("./data")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="libcurl")

unzip(zipfile="./data/Dataset.zip",exdir="./data")

NfilePath <- "C:/Users/khandizwe/Desktop/Coursera/EDA/Week1/ExData_Plotting1/data/household_power_consumption.txt"


indata <- read.table(NfilePath, header=T, sep=";")


indata$Date <- as.Date(indata$Date, format="%d/%m/%Y")

analysisdata <- indata[(indata$Date=="2007-02-01") | (indata$Date=="2007-02-02"),]

analysisdata$Global_active_power <- as.numeric(as.character(analysisdata$Global_active_power))
analysisdata$Voltage <- as.numeric(as.character(analysisdata$Voltage))
analysisdata$Global_reactive_power <- as.numeric(as.character(analysisdata$Global_reactive_power))

analysisdata <- transform(analysisdata, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
analysisdata$Sub_metering_1 <- as.numeric(as.character(analysisdata$Sub_metering_1))
analysisdata$Sub_metering_2 <- as.numeric(as.character(analysisdata$Sub_metering_2))
analysisdata$Sub_metering_3 <- as.numeric(as.character(analysisdata$Sub_metering_3))


#graphic plot

plot1 <- function() {
  hist(analysisdata$Global_active_power, main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
 
}
plot1()