# Exploratory Data Analysis Project 1 Plot 3
# Assumes data file is already in the working directory

# Read in the data file, specify that ? represents missing values
power <- read.table(file="household_power_consumption.txt",sep=";",header = TRUE,na.strings="?")

# Convert the Date field from type Factor to Date
power$Date <- as.Date(power$Date,format="%d/%m/%Y")

# Subset the data to only include February 1, 2007 and February 2, 2007
powerFeb <- subset(power,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Combine the Date and Time fields into one timestamp field
powerFeb$TimeStamp <- as.POSIXct(paste(powerFeb$Date,powerFeb$Time),format="%Y-%m-%d %H:%M:%S")

#Open the png device
png(file="plot3.png",width=480,height=480)

# Setup the canvas of the plot of Sub Metering by TimeStamp
plotGAP <- plot(powerFeb$TimeStamp,powerFeb$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")

# Add the lines to the canvas without the points for each sub metering level
lines(powerFeb$TimeStamp,powerFeb$Sub_metering_1,pch="",col="Black")
lines(powerFeb$TimeStamp,powerFeb$Sub_metering_2,pch="",col="Red")
lines(powerFeb$TimeStamp,powerFeb$Sub_metering_3,pch="",col="Blue")

# Add the legend to the plot
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"),lty=1)

# Close png connection
dev.off()