plot3<-function(){
        #Loading libraries graphics and grDevices
        library(grDevices)
        library(graphics)
        #Exctractind data
        data<-extract_data()
        #Opening new PNG graphical Device with specified parameters
        png(file = "plot3.png", width = 480, height = 480)
        #Drawing plot
        with(data,plot(strptime(paste(Date,Time,sep=" "),"%d/%m/%Y %H:%M:%S"),Sub_metering_1,type="l",col="black", xlab = "", ylab="Energy sub meters"))
        #Add points for 2nd variable
        with(data,points(strptime(paste(Date,Time,sep=" "),"%d/%m/%Y %H:%M:%S"),Sub_metering_2,type="l",col="red"))
        #Add points for 3rd variable
        with(data,points(strptime(paste(Date,Time,sep=" "),"%d/%m/%Y %H:%M:%S"),Sub_metering_3,type="l",col="blue"))
        #Add legend
        legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1)
        #Turning off PNG graphical device
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