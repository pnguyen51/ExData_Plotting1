

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

#plot 2
png('plot2.png')
plot(temp$Time, temp$Global_active_power, type='l', main='', xlab='', ylab='Global Active Power (kilowatts)')
dev.off()
