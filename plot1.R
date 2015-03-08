plot1 <- function()
{
	a <- read.table( "household_power_consumption.txt" , sep = ';' , header = TRUE )
	b <- a[(a$Date == "1/2/2007" | a$Date == "2/2/2007"),]
	jpeg(file = "plot1.png"  , height = 480 , width = 480)
	hist(as.numeric(as.character(b$Global_active_power)) , col = "red" , breaks = 12 , main = "Global Active Power" , xlab = "Global Active Power (kilowatts)")
	dev.off()
}
