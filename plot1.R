# read only required data i.e 2007-02-01 to 2007-02-02
req_data <- read.table(file = "household_power_consumption.txt",
                        sep = ";", skip = 66637, nrows = 2880,na.strings= "?") 

# get header row from the file
cnames <- colnames(read.table("household_power_consumption.txt", sep = ";",nrow = 1, header = TRUE)) 
# assign column names to above data set
names(req_data) <- cnames
str(req_data)
# creating Plot1 
png("plot1.png", width=480, height= 480)
hist(req_data$Global_active_power, col= "red", xlab= "Global Active Power (kilowatts)", ylab= "Frequency", main= "Global Active Power") 

dev.off() 