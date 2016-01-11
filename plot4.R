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
##png("plot4.png", width=480, height=480)

par(mfrow=c(2,2), mar= c(4,4,2,1))


## Creates the Global Active Power by Week Day Plot
plot(
        DateTime,
        plot_data$Global_active_power, 
        type = "l",
        main = " ", 
        xlab = " ",
        ylab = "Global Active Power (kilowatts)",
        lines(plot_data$Global_active_power, col="black")
     )


## Creates the Voltage by Week Day Plot
plot(
        DateTime,
        plot_data$Voltage, 
        type = "l",
        main = " ", 
        xlab = "datetime",
        ylab = "Voltage",
        lines(plot_data$Global_active_power, col="black")
    )

## Creates the Energy sub metering by Week Day Plot

plot(
        DateTime, 
        Sub_metering_1, 
        type = "l", xlab = "", 
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
        Sub_metering_3, 
        type = "l", 
        col= "blue"
)
legend(
        "topright",  
        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        lty = 1, 
        lwd = 2.5, 
        col = c("black","red","blue"),
        cex = .75,
        pt.cex = 1,
        bty = "n"
)

## Creates the Global Reactive Power by Week Day Plot
plot   (
        DateTime,
        plot_data$Global_reactive_power, 
        type = "l",
        main = " ", 
        xlab = "datetime",
        ylab = "Global_reactive_power",
        lines(plot_data$Global_active_power, col="black")
)

## dev.off shuts down the specified (by default the current) device
## --Remove ## to create image file

##dev.off()