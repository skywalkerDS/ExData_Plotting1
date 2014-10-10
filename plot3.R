hpc<-read.table("household_power_consumption.txt", sep=';', na.strings='?', as.is=T, nrows=3000, skip = 66600)
hpc_h<-read.table("household_power_consumption.txt", sep=';', header=F, as.is=T, nrows=1)
colnames(hpc) <- hpc_h
#str(hpc)
hpc <- transform(hpc, DTS = strptime(paste(hpc$Date, hpc$Time),'%d/%m/%Y %H:%M:%S'))
hpc <- hpc[month(hpc$DTS)==2 & (day(hpc$DTS)==1 | day(hpc$DTS)==2) & year(hpc$DTS)==2007,]
png(filename='plot3.png', height=480, width=480, bg='white')

plot(hpc$DTS,hpc$Sub_metering_1, type='l', xlab='', ylab='Energy sub mertering')
lines(hpc$DTS,hpc$Sub_metering_2,type='l',col='red')
lines(hpc$DTS,hpc$Sub_metering_3,type='l',col='blue')
legend('topright', colnames(hpc)[7:9], lty=1, col=c('black','red','blue'))

dev.off()
