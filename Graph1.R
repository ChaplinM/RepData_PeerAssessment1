# add day column
activity$CalDay = as.Date(activity$date, format="%Y-%m-%d")

actSteps  <- subset(activity, select=steps)
actCalDay <- subset(activity, select=CalDay)

#aggregate(activity$steps, activity$CalDay, sum, na.omit=T)
actDailySteps <- aggregate(actSteps, actCalDay, sum)

# draw a *base* graph consisitng of a histogram and vertical lines at mean and media
hist(actDailySteps$steps, col="lightyellow")
abline(v = median(actDailySteps$steps, na.rm=T), col = "blue", lwd = 4)
abline(v = mean(actDailySteps$steps, na.rm=T), col = "red", lty=2, lwd=4)
#quantile(actDailySteps$steps, probs=c(0.5))


# verifying that all nulls have been ignored and have not "poisoned" other values
subset(activity, date=="2012-10-01") # ok
subset(activity, date=="2012-10-08") # ok
subset(activity, date=="2012-11-01") # ok
subset(activity, date="2012-11-04")
subset(activity, date="2012-11-09")
subset(activity, date="2012-11-10")
subset(activity, date="2012-11-14")
subset(activity, date="2012-11-30")

