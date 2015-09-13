# Exploratory Data Analysis Project 1 Plot 2
# Assumes data file is already in the working directory

# Read in the data file, specify that ? represents missing values
power <- read.table(file="household_power_consumption.txt",sep=";",header = TRUE,na.strings="?")

# Convert the Date fields from type Factor to Date
power$Date <- as.Date(power$Date,format="%d/%m/%Y")

# Subset the data to only include February 1, 2007 and February 2, 2007
powerFeb <- subset(power,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Combine the Date and Time fields into one timestamp field
powerFeb$TimeStamp <- as.POSIXct(paste(powerFeb$Date,powerFeb$Time),format="%Y-%m-%d %H:%M:%S")

# Setup the canvas of the plot of Global Active Power by TimeStamp
plotGAP <- plot(powerFeb$TimeStamp,powerFeb$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="n")

# Add the lines to the canvas without the points
lines(powerFeb$TimeStamp,powerFeb$Global_active_power,pch="")

# Save the plot to a png file and close connection
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()