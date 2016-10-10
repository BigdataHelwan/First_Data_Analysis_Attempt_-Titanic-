#1. Descriptive Statistics
summary(mydata) 
# > summary(mydata)
# account_key          status         join_date    This is the label for variable 3 days_to_cancel   is_udacity   is_canceled
# Min.   :   0.0   canceled:988   2014-11-10: 131             :652                   Min.   :  0.00   False:1622   False:652  
# 1st Qu.: 322.0   current :652   2015-03-10:  92   2015-03-10: 77                   1st Qu.:  5.00   True :  18   True :988  
# Median : 635.5                  2015-04-08:  50   2015-04-08: 35                   Median : 22.00                           
# Mean   : 642.8                  2015-05-12:  43   2015-01-14: 34                   Mean   : 43.92                           
# 3rd Qu.: 969.2                  2015-04-01:  42   2015-02-03: 28                   3rd Qu.: 65.00                           
# Max.   :1305.0                  2015-01-12:  40   2015-04-01: 27                   Max.   :249.00                           
#                                 (Other)   :1242   (Other)   :787                   NA's   :652    

#using Hmisc package  [[[[[really AMAZING package!!!!!!!!!]]]]]
library(Hmisc)
describe(mydata)

#using pastecs package
library(pastecs)
stat.desc(mydata)

#Using the psych package
library(psych)
describe(mydata)

# The 'doBy' package provides much of the functionality of SAS PROC SUMMARY.
# It defines the desired table using a model formula and a function. Here is a simple example.
library(doBy)
names(mydata)[4] <- "cancel_date" #rename the 4th col to 'cancel_date'
cancel_date <- as.Date(mydata$cancel_date)
join_date <- as.Date(mydata$join_date)
cancel <- list(cancel_date)
join <- list(join_date)
summaryBy( cancel[1] - join[1], data = mydata, FUN = function(x) {c(mean = mean(x), Standard_Deviation = sd(x)) } )
#######################################################################3

#Quick Guide to learn Statistics for R Users (with Titanic Data Set)
train <- data.frame(Titanic)
mean <- mean(train$Freq)
mode(trian$Survived)

mode(train$Freq)
actual_mode <- table(train$Freq)
#find the most frequent value using max
names(actual_mode)[actual_mode == max(actual_mode)]

median(train$Freq)
range <- data.frame("minimum", "maximum")
range <- range(train$Freq)

install.packages(car)
library(car)
Boxplot(Age ~ Class, xlab="class", ylab="Age",col= c("red"), data = Titanic)





