# 1st Plot 

#Data aquisition 
hpc <- read.table('household_power_consumption.txt' , sep = ';' , header = TRUE, na.strings = '?')

head(hpc)
str(hpc)

# Date and Time Formating 
hpc  <-  transform(hpc , Date  = as.Date(as.character(hpc$Date), '%d/%m/%Y'))
hpc  <-  transform(hpc , Time  = strptime(paste(hpc$Date,hpc$Time), '%Y-%m-%d %H:%M:%S'))

# Data Subseting for interested days "2007-02-01 and 2007-02-02 "
hpc <- subset( hpc , Date > '2007-01-31'& Date < '2007-02-03')

head(hpc)
tail(hpc)

# Desired plot  
png(filename = 'plot1.png', height = 480 , width = 480)

with(hpc, hist(Global_active_power, col = 2, main = 'Global Active Power',xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency'))

dev.off()




