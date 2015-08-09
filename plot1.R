#Plotting Assignment 1 for Exploratory Data Analysis - Lakhani - 8/9/2015

#Pre-downloaded data from the UCI site into the ./data folder
UCIdataFile <- "./data/household_power_consumption.txt"

#Data read in through read.table.
pc_data <- read.table(UCIdataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")

#Object size is 149963400 bytes found by object.size(pc_data), therefore subsetting data by required dates
subSetDatabyDates <- data[pc_data$Date %in% c("1/2/2007","2/2/2007") ,]

#Selecting Global_active_power variable and setting it to be  numeric
byDateglobalActivePower <- as.numeric(subSetDatabyDates$Global_active_power)

#Creating the PNG with prescribed attributes and saving it as plot.png
png("plot1.png", width=480, height=480)

#Generating a histogram with appropriate naming
hist(byDateglobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Ensuring the device is turned off once the plot is created
dev.off()