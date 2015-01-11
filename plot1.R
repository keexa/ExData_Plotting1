setwd("~/Desktop/ExData_Plotting1/")
data_consumption <- read.csv("./household_power_consumption.txt",
                             sep=";",
                             na.strings=c("?"))
data_consumption$Date <- as.Date(data_consumption$Date, format = "%d/%m/%Y")
d1 <- as.Date("2007-02-01", format = "%Y-%m-%d")
d2 <- as.Date("2007-02-02", format = "%Y-%m-%d")
# Retrieve only the dataset with the dates specified
data_consumption_interval <- data_consumption[data_consumption$Date %in% c(d1, d2),]

par(mfrow = c(1, 1), cex = 0.75) #, mar = c(5, 4, 5, 4) + 0.1, oma = c(0, 2, 0, 0))

hist(data_consumption_interval$Global_active_power, 
     col ="red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.copy(png, file = "./plot1.png", width = 480, height = 480)
dev.off() 