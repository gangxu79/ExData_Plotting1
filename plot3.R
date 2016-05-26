# read data into R
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
# convert date and time
hpc$datetime <- strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S")
head(hpc)
# get data for two days
start_time <- strptime("2007-02-01 00:00:00", format = "%Y-%m-%d %H:%M:%S")
end_time <- strptime("2007-02-02 23:59:59", format = "%Y-%m-%d %H:%M:%S")
twodays <- subset(hpc, datetime >= start_time & datetime <= end_time)
head(twodays)
dim(twodays)

# plot3
png(filename = "plot3.png", width = 480, height = 480)
with(twodays, plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(twodays, lines(datetime, Sub_metering_1, col = "black"))
with(twodays, lines(datetime, Sub_metering_2, col = "red"))
with(twodays, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", colnames(twodays[,7:9]), lty = c(1,1,1), col = c("black","red","blue"))
dev.off()