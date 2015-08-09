#Plotting Assignment 1 for Exploratory Data Analysis - Lakhani - 8/9/2015

#Pre-downloaded data from the UCI site into the ./data folder
UCIdataFile <- "./data/household_power_consumption.txt"

#Data read in through read.table.
pc_data <- read.table(UCIdataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")

#Object size is 149963400 bytes found by object.size(pc_data), therefore subsetting data by required dates
subSetDatabyDates <- data[pc_data$Date %in% c("1/2/2007","2/2/2007") ,]

#Converting the Date and Time variables to Date/Time classes in R using the strptime() function
PCdatetime <- strptime(paste(subSetDatabyDates$Date, subSetDatabyDates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Selecting Global_active_power and Global_reactive_power variables and setting them to be  numeric
byDateglobalActivePower <- as.numeric(subSetDatabyDates$Global_active_power)
byDateglobalReactivePower <- as.numeric(subSetDatabyDates$Global_reactive_power)

#Selecting Voltage and setting it to be numeric
byDatevoltage <- as.numeric(subSetDatabyDates$Voltage)

#Setting Sub_metering variables to be numeric
PCsub_Metering1 <- as.numeric(subSetDatabyDates$Sub_metering_1)
PCsub_Metering2 <- as.numeric(subSetDatabyDates$Sub_metering_2)
PCsub_Metering3 <- as.numeric(subSetDatabyDates$Sub_metering_3)

#Creating the PNG with prescribed attributes and saving it as plot3.png
png("plot4.png", width=480, height=480)

#Setting up the plotter to plot 4 plots (2 rows and 2 columns)
par(mfrow = c(2, 2)) 

#Generating a plot with day on X and Global Active Power on Y with appropriate naming
plot(PCdatetime, byDateglobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#Generating a plot with day on X and Voltage on Y with appropriate naming
plot(PCdatetime, byDatevoltage, type="l", xlab="datetime", ylab="Voltage")

#Generating a plot with day on X and Sub_metering1 on Y with appropriate naming
plot(PCdatetime, PCsub_Metering1, type="l", ylab="Energy Submetering", xlab="")

#Adding line graph for day vs. Sub_metering2 in red
lines(PCdatetime, PCsub_Metering2, type="l", col="red")

#Adding line graph for day vs. Sub_metering3 in blue
lines(PCdatetime, PCsub_Metering3, type="l", col="blue")

#Adding legend on top-right describing the Y variables plotted
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#Generating a plot with day on X and Global Reactive Power on Y with appropriate naming
plot(PCdatetime, byDateglobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

#Ensuring the device is turned off once the plot is created
dev.off()