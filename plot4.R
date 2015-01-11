setwd("~/Desktop/ExData_Plotting1/")
data_consumption <- read.csv("./household_power_consumption.txt",
                             sep=";",
                             na.strings=c("?"))

data_time_string <- paste(data_consumption$Date, data_consumption$Time, sep = " ")
data_consumption$Time <- strptime(data_time_string, format="%d/%m/%Y %H:%M:%S")

data_consumption$Date <- as.Date(data_consumption$Date, format = "%d/%m/%Y")
d1 <- as.Date("2007-02-01", format = "%Y-%m-%d")
d2 <- as.Date("2007-02-02", format = "%Y-%m-%d")
# Retrieve only the dataset with the dates specified
data_consumption_interval <- data_consumption[data_consumption$Date %in% c(d1, d2),]
par(mfrow = c(2, 2), cex = 0.6 , mar = c(6, 4, 6, 4))

with(data_consumption_interval, {
  # 1
  plot(Time, Global_active_power,
        type = "l",
        xlab = "",
        ylab = "Global Active Power")
  
  # 2
  plot(Time, Voltage,
       type = "l",
       xlab = "datetime",
       ylab = "Voltage",
       col = "black")
  # 3
  plot(Time, Sub_metering_1,
       type = "l",
       xlab = "",
       ylab = "Energy sub metering",
       col = "black")
  lines(Time, 
        Sub_metering_2,
        col = "red")
  lines(Time, 
        Sub_metering_3,
        col = "blue")
  lines(Time, 
        Sub_metering_2,
        col = "red")
  lines(Time, 
        Sub_metering_3,
        col = "blue")
  
  legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col = c("black", "red", "blue"), lwd = 1, lty = 1, y.intersp = 2, x.intersp = 1, cex = 0.5, box.lwd = 0)
  # 4
  plot(Time, Global_reactive_power,
       type = "l",
       xlab = "datetime",
       col = "black")
})

dev.copy(png, file = "./plot4.png", width = 480, height = 480)
dev.off() 