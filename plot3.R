##Reset Global Environment
rm(list= ls())

## Working Directory
setwd("C:/Users/jeber/datasciencecoursera/Explore_Data")

## Read in data file and create a data table.
plot_data <- read.table('household_power_consumption.txt',sep=";", na.strings = "?", nrows=2880,skip=66637)
headers<-read.table('household_power_consumption.txt',nrows=1,header=T,sep=";")
colnames(plot_data)<- colnames(headers) 

##Creates the Date and Time Variable
DateTime<- strptime(paste(plot_data$Date,plot_data$Time, sep = " "), 
                    "%d/%m/%Y %H:%M:%S")

#create variables for each of the submetering vaues.
Sub_metering_1<- as.numeric(plot_data$Sub_metering_1)
Sub_metering_2<- as.numeric(plot_data$Sub_metering_2)
Sub_metering_3<- as.numeric(plot_data$Sub_metering_3)


## png() creates the png image. 
##--Remove ## to create image file

## png("plot3.png", width=480, height=480)

## Creates the Energy sub metering by Week Day Plot
par(cex = .751, mar=c(3,5,5,7))
plot(
     DateTime, 
     Sub_metering_1, 
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering"
     )
lines(
      DateTime,
      Sub_metering_2, 
      type = "l", 
      col="red"
      )
lines(
      DateTime,
      Sub_metering_3, type = "l", col= "blue"
      )
legend(
       "topright",  
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       xjust = 0,
       lty = 1, 
       lwd = 2.5, 
       col = c("black","red","blue"),
       cex = 1,
       pt.cex = 2
       )

## dev.off shuts down the specified (by default the current) device
## --Remove ## to create image file

## dev.off()