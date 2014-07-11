#loading the data
household_power_consumption <- read.csv("~/Dropbox/Coursera/Exploratory Analysis/Project 1/household_power_consumption.txt", sep=";")

#subsetting the data to only the dates we are interested in
dat<-household_power_consumption[66637:69516,]

#changing variables to correct formats
GAP <- as.numeric(as.character(dat$Global_active_power))
dateTime <- strptime( paste(dat$Date,dat$Time), format="%d/%m/%Y %H:%M:%S")

#creating the graph
png(filename = "plot2.png", width = 480, height = 480)
plot(dateTime, GAP, ylab="Global Active Power (kilowatts)",xlab="",type="l")
dev.off()