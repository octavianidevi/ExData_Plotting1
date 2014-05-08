plot2 <- function(){
        
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
        x <- as.numeric(dtss$Global_active_power)
        z <- strptime(paste(dtss$Date, dtss$Time), "%d/%m/%Y %H:%M:%S")
        
        par(mfrow=c(1,1), mar=c(4,4,2,2))       
        
        
        plot(z,x, type= "l",ylab = "Global Active Power (kilowatts)",xlab="")
        
        # create png file
        png(file="plot2.png", width = 480, height = 480)
        par(mfrow=c(1,1), mar=c(4,4,2,2))
        plot(z,x, type= "l",ylab = "Global Active Power (kilowatts)",xlab="")
        dev.off()
        
}