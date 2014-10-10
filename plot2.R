hpc<-read.table("household_power_consumption.txt", sep=';', na.strings='?', as.is=T, nrows=3000, skip = 66600)
hpc_h<-read.table("household_power_consumption.txt", sep=';', header=F, as.is=T, nrows=1)
colnames(hpc) <- hpc_h
#str(hpc)
hpc <- transform(hpc, DTS = strptime(paste(hpc$Date, hpc$Time),'%d/%m/%Y %H:%M:%S'))
hpc <- hpc[month(hpc$DTS)==2 & (day(hpc$DTS)==1 | day(hpc$DTS)==2) & year(hpc$DTS)==2007,]
png(filename='plot2.png', height=480, width=480, bg='white')

plot(hpc$DTS,hpc$Global_active_power, type="l", ylab='Global Active Power (kilowatts)', xlab='')

dev.off()
