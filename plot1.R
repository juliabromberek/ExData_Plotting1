#loading the data
household_power_consumption <- read.csv("~/Dropbox/Coursera/Exploratory Analysis/Project 1/household_power_consumption.txt", sep=";")

#subsetting the data to only the dates we are interested in
dat<-household_power_consumption[66637:69516,]

#changing variables to numeric
GAP <- as.numeric(as.character(dat$Global_active_power))

#creating the graph
png(filename = "plot1.png", width = 480, height = 480)
hist(GAP, col="red",xlab="Global Active Power (kilowatts)",ylim=range(0:1200), main="Global Active Power")
dev.off()