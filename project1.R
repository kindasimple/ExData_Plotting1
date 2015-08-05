source("power.R")

#
# Graph 1
#
hist(df$Global_active_power, xlab='Global Active Power (kilowatts)', ylab="Frequency", main="Global Active Power", col=c("Red"))

#
# Graph 2
#
plot(df$DateTime, df$Global_active_power, ylab='Global Active Power (kilowatts)', xlab='', type='l',  xaxt="n")
axis.POSIXct(1, at=seq(min(df$DateTime), max(df$DateTime+60), by="day"), format="%a", cex.axis = .7)

#
# Graph 3
#
with(df, {
  plot(Sub_metering_1 ~ DateTime, ylab='Energy sub metering', xlab='', type='l',  xaxt="n")
  lines(Sub_metering_2 ~ DateTime, type="l", col="red")
  lines(Sub_metering_3 ~ DateTime, type="l", col="blue")
  axis.POSIXct(1, at=seq(min(DateTime), max(DateTime+60), by="day"), format="%a", cex.axis = .7)
})
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1))

#
# Graph 4
#
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