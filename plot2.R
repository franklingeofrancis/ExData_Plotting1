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

png("plot2.png")
plot(rawdata$NewDate,rawdata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",main="")
dev.off()
