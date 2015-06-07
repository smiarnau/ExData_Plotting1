data <- read.table ("household_power_consumption.txt",  na.strings=c(""), sep=";", skip=1)
data$V1 <- as.character(data$V1)
newData1 <- data[data$V1=="1/2/2007"  ,]
newData2 <- data[data$V1=="2/2/2007"  ,]
newData <- rbind(newData1, newData2)

newData$V3 <- as.numeric(as.character(newData$V3))

hist(newData$V3, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png")
dev.off()
