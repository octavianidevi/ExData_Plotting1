plot4 <- function(){
        
        # read the file
        dt <- read.table("household_power_consumption.txt", sep=";", 
                         stringsAsFactors = FALSE, na.strings = "NA", 
                         col.names = c("Date","Time","Global_active_power", 
                                       "Global_reactive_power",
                                       "Voltage","Global_intensity",
                                       "Sub_metering_1","Sub_metering_2",
                                       "Sub_metering_3"))
        
        #dt <- read.table("household_power_consumption.txt", sep=";", 
        #                 skip = 66637, nrow=2880, stringsAsFactors = FALSE, 
        #                 na.strings = "NA",
        #                 col.names = c("Date","Time","Global_active_power", 
        #                                                              "Global_reactive_power",
        #                                                              "Voltage","Global_intensity",
        #                                                              "Sub_metering_1","Sub_metering_2",
        #                                                              "Sub_metering_3"))
        
        # filter certain date
        dtss <- subset(dt, dt$Date %in% c("1/2/2007", "2/2/2007"))
        
        #set variable
        gap <- as.numeric(dtss$Global_active_power)
        sm1 <- as.numeric(dtss$Sub_metering_1)
        sm2 <- as.numeric(dtss$Sub_metering_2)
        sm3 <- as.numeric(dtss$Sub_metering_3)
        v   <- as.numeric(dtss$Voltage)
        grp <- as.numeric(dtss$Global_reactive_power)
        datetime <- strptime(paste(dtss$Date, dtss$Time), "%d/%m/%Y %H:%M:%S")
        
        par(mfrow=c(2,2),mar=c(4,4,2,2))
        
        #plot 1
        plot(datetime,gap, type= "l",ylab = "Global Active Power",xlab="")
        #plot 2
        plot(datetime,v, type="l", ylab = "Voltage", xlab="datetime")        
        #plot 3        
        plot(datetime,sm1, type="l", ylab= "Energy sub metering",xlab="")
        lines(datetime,sm2, col="red")
        lines(datetime,sm3, col="blue")        
        legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        #plot 4
        plot(datetime,grp, type = "l", ylab="Global_reactive_power",xlab="datetime")
        
        
        # create png file
        png(file="plot4.png", width = 480, height = 480)
        par(mfrow=c(2,2),mar=c(4,4,2,2))
        #plot 1
        plot(datetime,gap, type= "l",ylab = "Global Active Power",xlab="")
        #plot 2
        plot(datetime,v, type="l", ylab = "Voltage", xlab="datetime")        
        #plot 3
        plot(datetime,sm1, type="l", ylab= "Energy sub metering",xlab="")
        lines(datetime,sm2, col="red")
        lines(datetime,sm3, col="blue")        
        legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        #plot 4
        plot(datetime,grp, type = "l", ylab="Global_reactive_power",xlab="datetime")
        dev.off()
}