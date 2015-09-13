# Exploratory Data Analysis Project 1 Plot 1
# Assumes data file is already in the working directory

# Read in the data file, specify that ? represents missing values
power <- read.table(file="household_power_consumption.txt",sep=";",header = TRUE,na.strings="?")

# Convert the Date fields from type Factor to Date
power$Date <- as.Date(power$Date,format="%d/%m/%Y")

# Subset the data to only include February 1, 2007 and February 2, 2007
powerFeb <- subset(power,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Create the histogram for Global Active Power
histgap <- hist(powerFeb$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

# Save the histogram to a png file and close connection
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()