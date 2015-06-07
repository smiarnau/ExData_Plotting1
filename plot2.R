data <- read.table ("household_power_consumption.txt",  na.strings=c(""), sep=";", skip=1)
data$V1 <- as.character(data$V1)
newData1 <- data[data$V1=="1/2/2007"  ,]
newData2 <- data[data$V1=="2/2/2007"  ,]
newData <- rbind(newData1, newData2)

newData$V3 <- as.numeric(as.character(newData$V3))
dateTime <- as.POSIXlt(paste(as.Date(newData$V1, format="%d/%m/%Y"), newData$V2, sep=" "))

#newData$V1 <- as.Date(strptime(newData$V1, format="%d/%m/%Y"))
#newData$V1 <- wday(as.Date(newData$V1, format="%Y-%m-%d"),label = TRUE, abbr = TRUE)
#newData$V1 <- as.factor(as.character(wday(as.Date(newData$V1, format="%Y-%m-%d"),label = TRUE, abbr = TRUE)))

plot(dateTime, newData$V3, type="l",xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png")
dev.off()
