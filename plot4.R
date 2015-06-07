data <- read.table ("household_power_consumption.txt",  na.strings=c(""), sep=";", skip=1)
data$V1 <- as.character(data$V1)
newData1 <- data[data$V1=="1/2/2007"  ,]
newData2 <- data[data$V1=="2/2/2007"  ,]
newData <- rbind(newData1, newData2)

newData$V3 <- as.numeric(as.character(newData$V3))
dateTime <- as.POSIXlt(paste(as.Date(newData$V1, format="%d/%m/%Y"), newData$V2, sep=" "))

par(mfrow = c(2, 2))

plot(dateTime, newData$V3, type="l",xlab="", ylab="Global Active Power")
plot(dateTime, newData$V5, type="l",xlab="datetime", ylab="Voltage")
    
with(newData,plot(dateTime, newData$V7, type="l",xlab="", ylab="Energy sub metering"))
with(subset(newData,select = c("V8")),lines(dateTime, newData$V8, type="l", col="red"))
with(subset(newData,select = c("V9")),lines(dateTime, newData$V9, type="l", col="blue"))
legend("topright", pch="-",adj=0.1, lwd=1, y.intersp=0.2, cex=.75, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(dateTime, newData$V4, type="l",xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png")
dev.off()

