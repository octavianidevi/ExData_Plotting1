plot3 <- function(){
        
        # read the file
        dt <- read.table("household_power_consumption.txt", sep=";", 
                         stringsAsFactors = FALSE, na.strings = "NA", 
                         col.names = c("Date","Time","Global_active_power", 
                                       "Global_reactive_power",
                                       "Voltage","Global_intensity",
                                       "Sub_metering_1","Sub_metering_2",
                                       "Sub_metering_3"))
        # filter certain date
        dtss <- subset(dt, dt$Date %in% c("1/2/2007", "2/2/2007"))
        
        #set variable
        x1 <- as.numeric(dtss$Sub_metering_1)
        x2 <- as.numeric(dtss$Sub_metering_2)
        x3 <- as.numeric(dtss$Sub_metering_3)
        z <- strptime(paste(dtss$Date, dtss$Time), "%d/%m/%Y %H:%M:%S")
                
        par(mfrow=c(1,1), mar=c(4,4,2,2))
        
        
        plot(z,x1, type="l", ylab= "Energy sub metering",xlab="")
        lines(z,x2, col="red")
        lines(z,x3, col="blue")        
        legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        # create png file
        png(file="plot3.png", width=480, height=480)
        par(mfrow=c(1,1), mar=c(4,4,2,2))
        plot(z,x1, type="l", ylab= "Energy sub metering",xlab="")
        lines(z,x2, col="red")
        lines(z,x3, col="blue")        
        legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        dev.off()
        
}