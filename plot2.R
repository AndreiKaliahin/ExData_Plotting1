plot2<-function(){
        #Loading libraries graphics and grDevices
        library(grDevices)
        library(graphics)
        #Exctractind data
        data<-extract_data()
        #Opening new PNG graphical Device with specified parameters
        png(file = "plot2.png", width = 480, height = 480)
        #Drawing plot
        with(data,plot(strptime(paste(Date,Time,sep=" "),"%d/%m/%Y %H:%M:%S"),Global_active_power,type="l", ylab = "Global Active Power (kilowatts)", xlab= ""))
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