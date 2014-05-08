plot1 <- function(){
        
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
        
        z <- strptime(paste(dtss$Date, dtss$Time), "%d/%m/%Y %H:%M:%S")
        x <- as.numeric(dtss$Global_active_power)
        
        par(mfrow=c(1,1),mar=c(4,4,2,2))
        
        
        hist(x, xlab = "Global Active Power (kilowatts)", 
             col="red", main = "Global Active Power")
        
        # create png file
        
        png(file="plot1.png", width = 480, height = 480)
        par(mfrow=c(1,1), mar=c(4,4,2,2))
        hist(x, xlab = "Global Active Power (kilowatts)", 
             col="red", main = "Global Active Power")
        dev.off()
                
}