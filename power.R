
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
df$Time <- strptime(df$Time, '%H:%M:%S')
