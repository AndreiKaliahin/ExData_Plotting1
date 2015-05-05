plot4<-function(){
        #Loading libraries graphics and grDevices
        library(grDevices)
        library(graphics)
        #Exctractind data
        data<-extract_data()
        #Opening new PNG graphical Device with specified parameters
        png(file = "plot4.png", width = 480, height = 480)
        #Drawing plot
        #Defining trellis panel
        par(mfcol=c(2,2), mar=c(5,5,3,1))
        
        #Adding plots
        ##Adding 1st plot
        with(data,plot(strptime(paste(Date,Time,sep=" "),"%d/%m/%Y %H:%M:%S"),Global_active_power,type="l", xlab = "", ylab="Global Active Power"))
        
        ##Adding 2nd plot
        with(data,plot(strptime(paste(Date,Time,sep=" "),"%d/%m/%Y %H:%M:%S"),Sub_metering_1,type="l",col="black", xlab = "", ylab="Energy sub meters"))
        ###Add points for 2nd variable
        with(data,points(strptime(paste(Date,Time,sep=" "),"%d/%m/%Y %H:%M:%S"),Sub_metering_2,type="l",col="red"))
        ###Add points for 3rd variable
        with(data,points(strptime(paste(Date,Time,sep=" "),"%d/%m/%Y %H:%M:%S"),Sub_metering_3,type="l",col="blue"))
        ###Add legend
        legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1)
        
        ##Adding 3rd plot
        with(data,plot(strptime(paste(Date,Time,sep=" "),"%d/%m/%Y %H:%M:%S"),Voltage,type="l", xlab = "datetime", ylab="Voltage"))
        
        ##Adding 4th plot
        with(data,plot(strptime(paste(Date,Time,sep=" "),"%d/%m/%Y %H:%M:%S"),Global_reactive_power,type="l", xlab = "datetime"))
        
        #Turn off device
        dev.off()
}

#Extracting data in a separate function
extract_data<-function(){
        #Extracting only few rows to define column classes
        tmp<-read.table("household_power_consumption.txt", sep = ";", nrows = 15, header = TRUE)
        #Defining column classes
        classes<-sapply(tmp, class)
        #Read full table with predefined colClasses. This increase reading speed in several times!
        full<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = classes, na.strings = "?")
        data<-suppressWarnings(full[full$Date==c("1/2/2007","2/2/2007"),])
        data
}