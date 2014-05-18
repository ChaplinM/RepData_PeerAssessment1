library(data.table)

#activity = read.csv("activity/activity.csv", header=T)
activity = read.table("activity/activity.csv", sep=",", header=T)
str(activity) # 17568 obs. of 3 variables etc.
summary(activity$steps) # NA's: 2304

class(activity) # "data.frame"
