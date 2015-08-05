##
## Download File
##
file.url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
file.zip <- 'exdata-data-household_power_consumption.zip'
file.data <- "household_power_consumption.txt"
if(!file.exists(file.zip)) {
  url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
  temp <- tempfile()
  download.file(url,temp)
  data <- read.csv(unz(temp, file.data), sep=";", stringsAsFactors=FALSE, na.strings = "?")
  unlink(temp)
} else {
  data <- read.csv(unz(file.zip, file.data), sep=";", stringsAsFactors=FALSE, na.strings = "?")
}

#
# Subset and convert
#
data$Date <- as.Date(data$Date, '%d/%m/%Y')
df <- data[data$Date >= as.Date('2007-02-01', '%Y-%m-%d') & data$Date < as.Date('2007-02-03', '%Y-%m-%d'), ]
df$DateTime <- as.POSIXct(paste(df$Date, df$Time), '%Y-%m-%d %H:%M:%S')

#
# Plot data
#
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12)
par(mfrow=c(2,2), mar=c(4,5,2,1), oma=c(2,0,4,0), cex.lab=.8)
with(df, {
  plot(Global_active_power ~ DateTime, ylab='Global Active Power', xlab='', type='l',  xaxt="n")
  axis.POSIXct(1, at=seq(min(DateTime), max(DateTime+60), by="day"), format="%a", cex.axis = .7)
})

with(df, {
  plot(Voltage ~ DateTime, type='l',  xaxt="n", xlab="datetime")
  axis.POSIXct(1, at=seq(min(DateTime), max(DateTime+60), by="day"), format="%a", cex.axis = .7)
})

with(df, {
  plot(Sub_metering_1 ~ DateTime, ylab='Energy sub metering', xlab='', type='l',  xaxt="n")
  lines(Sub_metering_2 ~ DateTime, type="l", col="red")
  lines(Sub_metering_3 ~ DateTime, type="l", col="blue")
  axis.POSIXct(1, at=seq(min(DateTime), max(DateTime+60), by="day"), format="%a", cex.axis = .7)
})
legend("topright", cex=.8, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), bty="n")

with(df, {
  plot(Global_reactive_power ~ DateTime, xlab='datetime', type='l',  xaxt="n")
  axis.POSIXct(1, at=seq(min(DateTime), max(DateTime+60), by="day"), format="%a", cex.axis = .7)
})
dev.off()
