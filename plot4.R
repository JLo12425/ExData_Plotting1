# Exploratory Data Analysis Project 1 Plot 4
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
png(file="plot4.png",width=480,height=480)

# Setup to have a matrix of plots that is 2 x 2
par(mfcol=c(2,2))

# Plot A - Global Active Power by TimeStamp
plotGAP <- plot(powerFeb$TimeStamp,powerFeb$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="n")
lines(powerFeb$TimeStamp,powerFeb$Global_active_power,pch="")

# Plot B - Sub Metering by TimeStamp
plotSub <- plot(powerFeb$TimeStamp,powerFeb$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
lines(powerFeb$TimeStamp,powerFeb$Sub_metering_1,pch="",col="Black")
lines(powerFeb$TimeStamp,powerFeb$Sub_metering_2,pch="",col="Red")
lines(powerFeb$TimeStamp,powerFeb$Sub_metering_3,pch="",col="Blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"),lty=1,bty="n")

# Plot C - Voltage by TimeStamp
plotVoltage <- plot(powerFeb$TimeStamp,powerFeb$Voltage,xlab="datetime",ylab="Voltage",type="n")
lines(powerFeb$TimeStamp,powerFeb$Voltage,pch="")

# Plot D - Global Reactive Power by TimeStamp
plotGRP <- plot(powerFeb$TimeStamp,powerFeb$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="n")
lines(powerFeb$TimeStamp,powerFeb$Global_reactive_power,pch="")

# Close png connection
dev.off()