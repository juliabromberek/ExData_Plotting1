#loading the data
household_power_consumption <- read.csv("~/Dropbox/Coursera/Exploratory Analysis/Project 1/household_power_consumption.txt", sep=";")

#subsetting the data to only the dates we are interested in
dat<-household_power_consumption[66637:69516,]

#changing variables to correct formats
GAP <- as.numeric(as.character(dat$Global_active_power))
Voltage <-as.numeric(as.character(dat$Voltage))
GAR <-as.numeric(as.character(dat$Global_reactive_power))
dateTime <- strptime( paste(dat$Date,dat$Time), format="%d/%m/%Y %H:%M:%S")

#creating the graph
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(dateTime, GAP, ylab="Global Active Power",xlab="",type="l")
plot(dateTime,Voltage,type="l", xlab="datetime")
plot(dateTime, meter1, ylab="Energy sub metering",xlab="",type="l")
lines(dateTime, meter2, col="red", type="l")
lines(dateTime, meter3, col="blue",type="l")
legend("topright", lty=1, lwd=2, col = c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
plot(dateTime, GAR, ylab="Global_reactive_power",xlab="datetime",type="l",ylim=c(ymin=0.0,ymax=0.5))
dev.off()