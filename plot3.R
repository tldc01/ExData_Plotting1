
elecdata<-read.table("household_power_consumption.txt", header = TRUE,colClasses=c(rep("character")), sep = ";" ) #read in the data
dim(elecdata)  #confirm it's all there!
febdata<-elecdata[elecdata$Date=="1/2/2007"|elecdata$Date=="2/2/2007",] #filter just Feb 1 and 2 in 2007
good<-subset(febdata,febdata[,1]!="?" & febdata[,2]!="?" & febdata[,3]!="?" & febdata[,4]!="?" & febdata[,5]!="?" & febdata[,6]!="?"
             & febdata[,7]!="?" & febdata[,8]!="?" & febdata[,9]!="?")  #remove incomplete/unknown values, if any


png(file="plot3.png",width=480,height=480) #set up output file

myts1<-ts(as.numeric(good$Sub_metering_1)) #create time series 1
myts2<-ts(as.numeric(good$Sub_metering_2)) #create time series 2
myts3<-ts(as.numeric(good$Sub_metering_3)) #create time series 3

plot(myts1,ylab="Energy sub metering",xlab=" ",xaxt="n") #generate graph
lines(myts2, col="red")  #add the second plot and make the line red
lines(myts3, col="blue")  #add the third plot and make the line blue
axis(side=1,at=c(0,1500,2880),labels=c("Thu","Fri","Sat"),tick=TRUE,lwd=1)  #add the formatting
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),bty="o",cex=.75) #add the legend

dev.off()
