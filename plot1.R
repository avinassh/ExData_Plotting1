# plot1.R - Histogram of Global Active Power

# problem statement: http://bit.ly/1l7vEmL
# author: avi

setwd('/Users/avi/Documents/code/coursera/exdata/cp1')

# Read the data and take subset of two days in 02/07 as mentioned in 
# assignment
data <- read.table('household_power_consumption.txt', sep=';', header=T, 
                   colClasses = c('character', 'character', 'numeric',
                                  'numeric', 'numeric', 'numeric',
                                  'numeric', 'numeric', 'numeric'),
                   na.strings='?')
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data <- subset(data, as.Date(DateTime) >= as.Date("2007-02-01") & 
                   as.Date(DateTime) <= as.Date("2007-02-02"))

png("plot1.png", height=640, width=640)

hist(data$Global_active_power, col='red', main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)')

dev.off()