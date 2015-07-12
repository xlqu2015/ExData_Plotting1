plot2 <- function(filename = "household_power_consumption.txt") {
  ## Exploratory Data Analysis - Project 1, Plot 2
  
  ## This function reads the household energy usage data from the given file,   
  ## 	extracts the usage data from 2/1/2007 to 2/2/2007 (two-day data), and 
  ## 	plots a scatterplot of Global Active Power over two days.
  
  ## Arguments
  ##   'filename' is a character vector of length 1 indicating
  ## 		the location of the CSV data file
  
  ## No return value  
  ## 	The plot constructed is saved to "plot2.png".
  
  
  ## Read the household energy usage data from the given file	
  x <- read.table(filename, sep=";", header=TRUE, colClasses="character")
  
  ## Extract the usage data from 2/1/2007 to 2/2/2007 (two-day data)  
  x$Date <- as.Date(x$Date, "%d/%m/%Y")
  y <- x[(x$Date >= "2007-02-01" & x$Date <= "2007-02-02"), ]
  
  ## Convert the data columns to the formats needed
  y$DateTime <- paste(y$Date, y$Time, sep = " ")
  y$DateTime <- as.POSIXlt(y$DateTime, format = "%Y-%m-%d %H:%M:%S")
  
  y[,3] <- as.numeric(y[,3])
  y[,4] <- as.numeric(y[,4])
  y[,5] <- as.numeric(y[,5])
  y[,6] <- as.numeric(y[,6])
  y[,7] <- as.numeric(y[,7])
  y[,8] <- as.numeric(y[,8])
  y[,9] <- as.numeric(y[,9])
  
  ## Plot a scatterplot of Global Active Power over DateTime in data frame y
  ##    to a PNG file with dimension of 480X480
  library(datasets)
  png(filename="plot2.png", width = 480, height = 480) ## Open PNG device
  plot(y$DateTime, y$Global_active_power, type = "l", xlab="", 
       ylab="Global Active Power (kilowatts)")  ## Plot the scatterplot
  dev.off()   ## Close the PNG file
}