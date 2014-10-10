hpc<-read.table("household_power_consumption.txt", sep=';', na.strings='?', as.is=T, nrows=3000, skip = 66600)
hpc_h<-read.table("household_power_consumption.txt", sep=';', header=F, as.is=T, nrows=1)
colnames(hpc) <- hpc_h
#str(hpc)
hpc <- transform(hpc, DTS = strptime(paste(hpc$Date, hpc$Time),'%d/%m/%Y %H:%M:%S'))
hpc <- hpc[month(hpc$DTS)==2 & (day(hpc$DTS)==1 | day(hpc$DTS)==2) & year(hpc$DTS)==2007,]
png(filename='plot4.png', height=480, width=480, bg='white')

par(mfrow=c(2,2))

plot(hpc$DTS,hpc$Global_active_power, type="l", ylab='Global Active Power', xlab='')

plot(hpc$DTS,hpc$Voltage, type="l", ylab='Voltage', xlab='datetime')

plot(hpc$DTS,hpc$Sub_metering_1, type='l', xlab='', ylab='Energy sub mertering')
lines(hpc$DTS,hpc$Sub_metering_2,type='l',col='red')
lines(hpc$DTS,hpc$Sub_metering_3,type='l',col='blue')
legend('topright', colnames(hpc)[7:9], lty=1, col=c('black','red','blue'), bty='n')

plot(hpc$DTS,hpc$Global_reactive_power, type="l", xlab='datetime', ylab='Global_rective_power')

dev.off()

