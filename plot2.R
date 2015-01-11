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

par(mfrow = c(1, 1), cex=0.75)


with(data_consumption_interval,
     plot(Time, Global_active_power,
          type = "l",
          xlab = "",
          ylab = "Global Active Power (kilowatts)"))

dev.copy(png, file = "./plot2.png", width = 480, height = 480)
dev.off() 