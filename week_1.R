 y <- c(5, 7, 9,11)
 x <- c(2,3, 4,5)
 par(mfrow=c(1, 2))

 model1 <- lm(y~x)
 plot(x, y, main = "y ~ a + bx")
 abline(a = model1$coefficients[[1]], b= model1$coefficients[[2]], col = "blue")
 model2 <-  lm(y~I(x^2))
 plot(x, y, main = "y ~ x^2")
 abline(a = model2$coefficients[[1]], b = model2$coefficients[[2]], col = "magenta")
 curve(model2$coefficients[[1]]+ model2$coefficients[[2]]*x^2)
 
 ##
hpc <-  read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)


#We will only be using data from the dates 2007-02-01 and 2007-02-02
#hpc_data <- subset(hpc, Date < as.Date("2007-02-03") & Date > as.Date("2007-01-31"))

hpc_dat <- hpc[66637:69516, ]
hpc_dat[, "Date"] <- dmy(hpc_dat$Date)
hpc_dat[, "Date_Time"] <- paste(hpc_dat$Date, hpc_dat$Time, sep = " ")
hpc_dat[, "DateTime"] <- as.POSIXct(hpc_dat$Date_Time, format="%Y-%m-%d %H:%M:%S")


#PLOT NO. 1
png("plot1.png")
hist(as.numeric(hpc_data$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()

#PLOT NO. 2
#Sys.setlocale("LC_TIME", "English")
png("plot2.png")
plot( hpc_dat$DateTime,  hpc_dat$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab= "", type="l")
dev.off()

#PLOT NO. 3

png("plot3.png")

plot(hpc_dat$DateTime, hpc_dat$Sub_metering_1, type= "n")
plot(hpc_dat$DateTime, hpc_dat$Sub_metering_1, type= "l", xlab = "", ylab = "Energy sub metering")
lines(hpc_dat$DateTime, hpc_dat$Sub_metering_2, type= "l", col= "red")
lines(hpc_dat$DateTime, hpc_dat$Sub_metering_3, type= "l", col="blue")
legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), pch = "-", 
       col= c("black", "red", "blue"))

dev.off()

#PLOT NO. 4
par(mfrow= c(2,2))
png("plot4.png")
plot( hpc_dat$DateTime,  hpc_dat$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab= "", type="l")
plot(hpc_dat$DateTime, hpc_dat$Voltage, xlab = "datetime", ylab = "Voltage", type = "l" )


  plot(hpc_dat$DateTime, hpc_dat$Sub_metering_1, type= "l", xlab = "", ylab = "Energy sub metering")
  lines(hpc_dat$DateTime, hpc_dat$Sub_metering_2, type= "l", col= "red")
  lines(hpc_dat$DateTime, hpc_dat$Sub_metering_3, type= "l", col="blue")
  legend(x= c(hpc_dat$DateTime[1900], hpc_dat$DateTime[2880]), y= c(20,40), legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"),
         lty = c(1, 1), col= c("black", "red", "blue"), cex = 0.5, lwd = c(2,2,2))



plot(hpc_dat$DateTime, hpc_dat$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power",
     type = "l")
dev.off()
