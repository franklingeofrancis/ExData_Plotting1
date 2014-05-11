setwd("C:/Data Science/Coursera/Data Science Specialization - Coursera/Exploratory Data Analysis/ExData_Plotting1/")
options(stringsAsFactors=FALSE)

#reading data
rawdata_100<-read.table('household_power_consumption.txt',header=TRUE,sep=";",nrows=100)
classvar<-sapply(rawdata_100,class)
rawdata<-read.table('household_power_consumption.txt',header=TRUE,sep=";",colClasses=classvar,na.strings="?")

#modifying the data & time variables
rawdata$Date<-as.Date(rawdata$Date,format="%d/%m/%Y")
rawdata$Time<-strptime(rawdata$Time,format="%H:%M:%S")

##filtering for data
rawdata<-rawdata[(rawdata$Date %in% as.Date(c("2007-02-01","2007-02-02"))),]

##creating a date column with the both date & time field
rawdata$NewDate<-paste(rawdata$Date,format(rawdata$Time,format="%H:%M:%S"))
rawdata$NewDate<-strptime(rawdata$NewDate,format="%Y-%m-%d %H:%M:%S")

##plot
pardefault<-par(no.readonly=TRUE)

png('plot4.png')
par(mfrow=c(2,2))

#plot1
plot(rawdata$NewDate,rawdata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",main="")

#plot2
plot(rawdata$NewDate,rawdata$Voltage,type="l",xlab="datetime",ylab="Voltage",main="")

#plot3
plot(rawdata$NewDate,rawdata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(rawdata$NewDate,rawdata$Sub_metering_2,col="red")
lines(rawdata$NewDate,rawdata$Sub_metering_3,col="blue")
legend("topright",title="",c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c("black","red","blue"),lty=1,cex=0.8,bty="n")

#plot4
plot(rawdata$NewDate,rawdata$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power",main="")

dev.off()

