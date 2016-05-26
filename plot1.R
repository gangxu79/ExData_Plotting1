# read data into R
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
# convert date and time
hpc$datetime <- strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S")
head(hpc)
# get data for two days
start_time <- strptime("2007-02-01 00:00:00", format = "%Y-%m-%d %H:%M:%S")
end_time <- strptime("2007-02-02 23:59:59", format = "%Y-%m-%d %H:%M:%S")
twodays <- subset(hpc, datetime >= start_time & datetime <= end_time)
# verify data
head(twodays)
dim(twodays)

# plot 1
png(filename = "plot1.png", width = 480, height = 480)
hist(twodays$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")
dev.off()