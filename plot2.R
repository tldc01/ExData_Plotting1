
elecdata<-read.table("household_power_consumption.txt", header = TRUE,colClasses=c(rep("character")), sep = ";" ) #read in the data
dim(elecdata)  #confirm it's all there!
febdata<-elecdata[elecdata$Date=="1/2/2007"|elecdata$Date=="2/2/2007",] #filter just Feb 1 and 2 in 2007
good<-subset(febdata,febdata[,1]!="?" & febdata[,2]!="?" & febdata[,3]!="?" & febdata[,4]!="?" & febdata[,5]!="?" & febdata[,6]!="?"
             & febdata[,7]!="?" & febdata[,8]!="?" & febdata[,9]!="?")  #remove incomplete/unknown values, if any


png(file="plot2.png",width=480,height=480) #set up output file

myts<-ts(as.numeric(good$Global_active_power)) #create time series

plot(myts,ylab="Global Active Power (kilowatts)",xlab=" ",xaxt="n") #generate graph
axis(side=1,at=c(0,1500,2880),labels=c("Thu","Fri","Sat"),tick=TRUE,lwd=1)  #add the formatting

dev.off()
