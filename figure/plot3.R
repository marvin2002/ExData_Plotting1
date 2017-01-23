
#Read the data

hpc <-  read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)


#We will only be using data from the dates 2007-02-01 and 2007-02-02
#hpc_data <- subset(hpc, Date < as.Date("2007-02-03") & Date > as.Date("2007-01-31"))

hpc_dat <- hpc[66637:69516, ]
hpc_dat[, "Date"] <- dmy(hpc_dat$Date)
hpc_dat[, "Date_Time"] <- paste(hpc_dat$Date, hpc_dat$Time, sep = " ")
hpc_dat[, "DateTime"] <- as.POSIXct(hpc_dat$Date_Time, format="%Y-%m-%d %H:%M:%S")

#PLOT NO. 3

png("plot3.png", width = 480, height = 480)
plot(hpc_dat$DateTime, hpc_dat$Sub_metering_1, type= "n")
plot(hpc_dat$DateTime, hpc_dat$Sub_metering_1, type= "l", xlab = "", ylab = "Energy sub metering")
lines(hpc_dat$DateTime, hpc_dat$Sub_metering_2, type= "l", col= "red")
lines(hpc_dat$DateTime, hpc_dat$Sub_metering_3, type= "l", col="blue")
legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), pch = "-", 
       col= c("black", "red", "blue"))
dev.off()
