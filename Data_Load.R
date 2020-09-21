
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na = "?")
attach(data)
data1 <- data[(Date == "1/2/2007" | Date == "2/2/2007"), ]
attach(data1)
data1$DateTime <- strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")
rownames(data1) <- 1 : nrow(data1)
attach(data1)
data1 <- cbind(data1[, 10], data1[, 3:9])
colname <- colnames(data1)
colname[1] <- "Date_time"
colnames(data) <- colname
attach(data1)
write.csv(data, file = "./PowerConsumption.csv", row.names = FALSE)
