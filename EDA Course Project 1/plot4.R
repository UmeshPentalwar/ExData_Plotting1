# 2nd Plot 

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
png(filename = 'plot4.png', height = 480, width = 480)
par(mfrow = c(2,2), mar = c(5,5,2,2))

with(hpc, { plot(Time , Global_active_power, type = 'l', ylab = 'Global Active Power')
            plot(Time , Voltage, type = 'l', xlab = 'datetime')
            plot(Time , Sub_metering_1 , type  = 'l', col = 1 , ylab = 'Energy Sub Metering')
            points(Time , Sub_metering_2, type = 'l', col = 2)
            points(Time, Sub_metering_3, type = 'l', col = 'blue')
            legend('topright', lty = 1, col = c('black','red','blue'),legend = paste0('Sub_metering_',1:3),bty = 'n')
            plot(Time, Global_reactive_power, type = 'l', xlab = 'datetime')
            }
    )

dev.off()