# add day column
#activity$CalDay = as.Date(activity$date, format="%Y-%m-%d")

#actSteps  <- subset(activity, select=steps)
actInterval <- subset(activity, select=interval)

#aggregate(activity$steps, activity$CalDay, sum, na.omit=T)
actIntervalSteps <- aggregate(actSteps, actInterval, mean, na.rm=T)

plot(actIntervalSteps$steps ~ actIntervalSteps$interval, type="l", xlab="Hours and minutes", 
     ylab="Mean interval steps")

# checking the first few intervals
subset(activity, interval==0)  # shd get mean := 91/53
subset(activity, interval==5)  # shd get mean := 18/53
subset(activity, interval==10) # shd get mean := 7/53
subset(activity, interval==15) # shd get mean := 8/53
subset(activity, interval==20) # shd get mean := 4/53
subset(activity, interval==25) # shd get mean := 111/53

# max value?
maxVal = max(actIntervalSteps$steps)
maxVal

# occurring at?
maxAt = actIntervalSteps[which.max(actIntervalSteps$steps),"interval"]
maxAt

# or in 24h notation:
maxZeroPad = sprintf("%04d", maxAt)
max24h = paste(substr(maxZeroPad,1,2),substr(maxZeroPad,3,4),sep="h")
max24h

# checking the max value
subset(actIntervalSteps, steps>maxVal-0.001)



