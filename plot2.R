plot2 <- function()
{
	a <- read.table( "household_power_consumption.txt" , sep = ';' , header = TRUE )
	b <- a[(a$Date == "1/2/2007" | a$Date == "2/2/2007"),]
	b$Date <- as.Date(b$Date , "%d/%m/%Y")
	b$Time <- paste(b$Date, b$Time, sep=" ")
	b$Time <- strptime(b$Time, "%Y-%m-%d %H:%M:%S")
	png("plot2.png", width = 480, height = 480)
	plot(b$Time, b$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)" , type = "l")
	dev.off()
}