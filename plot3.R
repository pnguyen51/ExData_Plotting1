

# read data
temp <- read.table('household_power_consumption.txt',TRUE,';',stringsAsFactors=FALSE)
# transform dates
temp$Date <- as.Date(temp$Date, '%d/%m/%Y')
# subset data between for dates between 2007-02-01 and 2007-02-02
temp <- subset(temp, Date >= '2007-02-01' & Date <= '2007-02-02')
#
temp$Time <- strptime(paste(temp$Date, temp$Time, sep=' '), '%Y-%m-%d %H:%M:%S')

for(ii in 3:(ncol(temp)-1)){
	temp[,ii] <- as.numeric(as.character(temp[,ii]))
}

#plot 3
png('plot3.png')
plot(temp$Time, temp$Sub_metering_1, type='l', col=1, xlab='', ylab='Energy sub metering')
lines(temp$Time, temp$Sub_metering_2, col='red')
lines(temp$Time, temp$Sub_metering_3, col='purple')
legend('topright', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black','red','purple'), lwd=1)
dev.off()