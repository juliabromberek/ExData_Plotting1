#loading the data
household_power_consumption <- read.csv("~/Dropbox/Coursera/Exploratory Analysis/Project 1/household_power_consumption.txt", sep=";")

#subsetting the data to only the dates we are interested in
dat<-household_power_consumption[66637:69516,]

#changing variables to correct formats
dateTime <- strptime( paste(dat$Date,dat$Time), format="%d/%m/%Y %H:%M:%S")
meter1 <- as.numeric(as.character(dat$Sub_metering_1))
meter2 <- as.numeric(as.character(dat$Sub_metering_2))
meter3 <- as.numeric(as.character(dat$Sub_metering_3))

#creating the graph
png(filename = "plot3.png", width = 480, height = 480)
plot(dateTime, meter1, ylab="Energy sub metering",xlab="",type="l")
lines(dateTime, meter2, col="red", type="l")
lines(dateTime, meter3, col="blue",type="l")
legend("topright", lty=1, lwd=2, col = c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
