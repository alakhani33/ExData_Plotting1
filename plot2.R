#Plotting Assignment 1 for Exploratory Data Analysis - Lakhani - 8/9/2015

#Pre-downloaded data from the UCI site into the ./data folder
UCIdataFile <- "./data/household_power_consumption.txt"

#Data read in through read.table.
pc_data <- read.table(UCIdataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")

#Object size is 149963400 bytes found by object.size(pc_data), therefore subsetting data by required dates
subSetDatabyDates <- data[pc_data$Date %in% c("1/2/2007","2/2/2007") ,]

#Converting the Date and Time variables to Date/Time classes in R using the strptime() function
PCdatetime <- strptime(paste(subSetDatabyDates$Date, subSetDatabyDates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Selecting Global_active_power variable and setting it to be  numeric
byDateglobalActivePower <- as.numeric(subSetDatabyDates$Global_active_power)

#Creating the PNG with prescribed attributes and saving it as plot2.png
png("plot2.png", width=480, height=480)

#Generating a plot with day on X and power on Y with appropriate naming
plot(PCdatetime, byDateglobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Ensuring the device is turned off once the plot is created
dev.off()