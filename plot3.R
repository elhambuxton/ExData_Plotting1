#Reading the file in to a dataframe
power<-read.table("household_power_consumption.txt", sep=';',header=TRUE, na.strings = "?")
power_df<-subset(power, Date=="1/2/2007" | Date=="2/2/2007")

# converting Date and Time
power_df$Time<-strptime(paste(power_df$Date,power_df$Time), format="%d/%m/%Y %H:%M:%S")


png(filename="plot3.png",height=480, width=480)
plot(power_df$Time,power_df$Sub_metering_1, type="n", ylab="Energy Sub metering", xlab="")
lines(power_df$Time,power_df$Sub_metering_1, col="black")
lines(power_df$Time,power_df$Sub_metering_2, col="red")
lines(power_df$Time,power_df$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=1, lwd=2)
dev.off()