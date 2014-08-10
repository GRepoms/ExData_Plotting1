# read only required data i.e 2007-02-01 to 2007-02-02
req_data <- read.table(file = "household_power_consumption.txt",
                        sep = ";", skip = 66637, nrows = 2880,na.strings= "?") 

# get header row from the file
cnames <- colnames(read.table("household_power_consumption.txt", sep = ";",nrow = 1, header = TRUE)) 
# assign column names to above data set
names(req_data) <- cnames
str(req_data)
datetime <- paste(req_data$Date,req_data$Time)
#calculate day of the week
weekday <- strptime(datetime, format ='%d/%m/%Y %H:%M:%S')
str(weekday)
# creating Plot3 
png("plot3.png", width=480, height= 480)
plot(weekday,req_data$Sub_metering_1,type="S",col = "black",xlab="",ylab="Energy sub metering")
#plot lines for sub metereing 2
lines(weekday,req_data$Sub_metering_2, type = "S",col = "red")
#plot lines for sub metereing 3 
lines(weekday,req_data$Sub_metering_3, type = "S",col = "blue")
# add legend to the plot
legend("topright", lty=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off() 