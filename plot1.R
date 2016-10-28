
elecdata<-read.table("household_power_consumption.txt", header = TRUE,colClasses=c(rep("character")), sep = ";" ) #read in the data
dim(elecdata)  #confirm it's all there!
febdata<-elecdata[elecdata$Date=="1/2/2007"|elecdata$Date=="2/2/2007",] #filter just Feb 1 and 2 in 2007
good<-subset(febdata,febdata[,1]!="?" & febdata[,2]!="?" & febdata[,3]!="?" & febdata[,4]!="?" & febdata[,5]!="?" & febdata[,6]!="?"
             & febdata[,7]!="?" & febdata[,8]!="?" & febdata[,9]!="?")  #remove incomplete/unknown values, if any

#range(as.numeric(good$Global_active_power))
png(file="plot1.png",width=480,height=480) #set up graph

hist(as.numeric(good$Global_active_power),col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") #generate histogram

dev.off()
