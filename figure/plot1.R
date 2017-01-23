hpc <-  read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)


#We will only be using data from the dates 2007-02-01 and 2007-02-02
#hpc_data <- subset(hpc, Date < as.Date("2007-02-03") & Date > as.Date("2007-01-31"))

hpc_dat <- hpc[66637:69516, ]
hpc_dat[, "Date"] <- dmy(hpc_dat$Date)
hpc_dat[, "Date_Time"] <- paste(hpc_dat$Date, hpc_dat$Time, sep = " ")
hpc_dat[, "DateTime"] <- as.POSIXct(hpc_dat$Date_Time, format="%Y-%m-%d %H:%M:%S")


#PLOT NO. 1
png("plot1.png", width = 480, height = 480)
hist(as.numeric(hpc_data$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()
