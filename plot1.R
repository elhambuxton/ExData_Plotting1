#Reading the file in to a dataframe
power<-read.table("household_power_consumption.txt", sep=';',header=TRUE, na.strings = "?")
power_df<-subset(power, Date=="1/2/2007" | Date=="2/2/2007")

# converting Date and Time
power_df$Date<-as.Date(power_df$Date)
power_df$Time<-strptime(paste(power_df$Date,power_df$Time), format="%d/%m/%Y %H:%M:%S")



png(filename="plot1.png", height=480, width=480)
hist(power_df$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
