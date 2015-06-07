a <- read.table("household_power_consumption.txt", sep = ';' , header = TRUE)
a$Date <- as.Date(a$Date , "%d/%m/%Y")
b <- a[a$Date == "2007-02-01" | a$Date == "2007-02-02" ,]
b$Time <- paste(b$Date, b$Time, sep=" ")
b$Time <- strptime(b$Time, "%Y-%m-%d %H:%M:%S")
png("plot2.png", width = 480, height = 480)
plot(b$Time, b$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)" , type = "l")
dev.off()
