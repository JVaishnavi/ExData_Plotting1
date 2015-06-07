
a <- read.table("household_power_consumption.txt", sep = ';' , header = TRUE)
a$Date <- as.Date(a$Date , "%d/%m/%Y")
b <- a[a$Date == "2007-02-01" | a$Date == "2007-02-02" ,]
png("plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(b$Global_active_power)), col = "red" , main = "Global Active Power" ,  xlab = "Global Active power (Kilowatts)")
dev.off()