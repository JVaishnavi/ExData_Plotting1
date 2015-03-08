plot4 <- function()
{
	a <- read.table("household_power_consumption.txt", sep = ";" , header = TRUE);
	b <- a[(a$Date == "1/2/2007" | a$Date =="2/2/2007"),]

	b$Date <- as.Date(b$Date , "%d/%m/%Y")
	b$Time <- paste(b$Date, b$Time, sep=" ")
	b$Time <- strptime(b$Time, "%Y-%m-%d %H:%M:%S")

	png("plot4.png", width = 480, height = 480)
	par(mfrow = c(2, 2))
	with(b, 
	{
  		plot(Time, as.numeric(as.character(Global_active_power)), type = "l", xlab = "", ylab = "Global Active Power")
  		plot(Time, as.numeric(as.character(Voltage)), xlab = "datetime", type = "l", ylab = "Voltage")
		ylimits = range(c(b$Sub_metering_1, b$Sub_metering_2, b$Sub_metering_3))
  		plot(Time, as.numeric(as.character(Sub_metering_1)), xlab = "", ylab = "Energy sub metering", type = "l", ylim = ylimits, col = "black")

		par(new = TRUE)
  		plot(Time, as.numeric(as.character(Sub_metering_2)), xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "red")
  		par(new = TRUE)
  		plot(Time, as.numeric(as.character(Sub_metering_3)), xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "blue")
  		legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         		bg = "transparent",
         		bty = "n",
         		lty = c(1,1,1),
         		col = c("black", "red", "blue"))

		  	plot(Time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  
	}
	)
	dev.off()
}