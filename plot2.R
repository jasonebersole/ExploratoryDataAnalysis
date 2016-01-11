##Reset Global Environment
rm(list= ls())

## Working Directory
setwd("C:/Users/jeber/datasciencecoursera/Explore_Data")

## Read in data file and create headers.
plot_data <- read.table('household_power_consumption.txt',sep=";", na.strings = "?", nrows=2880,skip=66637)
headers<-read.table('household_power_consumption.txt',nrows=1,header=T,sep=";")
colnames(plot_data)<- colnames(headers) 

##Creates the Date and Time Variable
DateTime<- strptime(paste(plot_data$Date,plot_data$Time, sep = " "), 
                    "%d/%m/%Y %H:%M:%S")


## png() creates the png image. 
## --Remove ## to create image file
## png("plot2.png", width=480, height=480, type = c("windows"))

## Creates plot of Global_active_power by Days of the Week (Date/Time)
plot(
        DateTime,
        plot_data$Global_active_power, 
        type = "l",
        main = " ", 
        xlab = " ",
        ylab = "Global Active Power (kilowatts)",
        lines(plot_data$Global_active_power, col="black")
     )

## dev.off shuts down the specified (by default the current) device
## --Remove ## to create image file

## dev.off()