#Reading the file in to a dataframe
power<-read.table("household_power_consumption.txt", sep=';',header=TRUE, na.strings = "?")
power_df<-subset(power, Date=="1/2/2007" | Date=="2/2/2007")

# converting Date and Time
power_df$Time<-strptime(paste(power_df$Date,power_df$Time), format="%d/%m/%Y %H:%M:%S")



png(filename="plot2.png", height=480, width=480)
with(power_df,plot(power_df$Time,Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()