# first row contains variable names, comma is separator 
# assign the variable id to row names
# note the / instead of \ on mswindows systems 

mydata <- read.table("D:/Graduation project/intro to Data Analysis- udicity/enrollments.csv", header=TRUE, sep = "," )

#create a data frame from scratch
age <- c(25, 30, 56)
gender <- c("male", "female", "male")
weight <- c(160, 110, 220)
mydata1 <- data.frame(age,gender,weight)

# enter data using editor 
mydata2 <- data.frame(age=numeric(0), gender=character(0), weight=numeric(0))
mydata2 <- edit(mydata2)   

# RODBC Example: package provides access to databases (including Microsoft Access and Microsoft SQL Server) through an ODBC interface.
    #The RMySQL package provides an interface to MySQL.
    #The ROracle package provides an interface for Oracle.
    #The RJDBC package provides access to databases through a JDBC interface.
# import 2 tables (Crime and Punishment) from a DBMS
# into R data frames (and call them crimedat and pundat)
library(RODBC)
myconn <- odbcConnect("mydsn", uid ="Rob", pwd = "aardvark" ) #mydsn : character string. A registered data source name.
crimedat <- sqlFetch(myconn, "Crime")
pundat <- sqlQuery(mtconn, "select * from punishment")

#Exporting Data,exporting R objects into other formats
#To An Excel spreadsheet
library(xlsx)
write.xlsx(mydata2,"D:/Graduation project/intro to Data Analysis- udicity/Export_data_trial.xlsx")

#Getting Information on a Dataset
ls()
names(mydata1)
str(mydata1)
# list levels of factor v1 in mydata
levels(mydata1)
# dimensions of an object
dim(mydata1)
head(mydata, n=10)#first 20 rows
tail(mydata, n=5)#last 5 rows

#value labels
# variable v1 is coded 1, 2 or 3
# we want to attach value labels 1=red, 2=blue, 3=green

mydata1$age <- factor(mydata1$age, levels = c(1,2,3), labels = c("red", "blue", "green"))
mydata1 <- edit(mydata1)

#Missing Data
is.na(age)
y <- c(1,2,3,NA)
m <- c(NA,4,6,8)
is.na(y)
mydata3 <- data.frame(y,m)
#Recoding Values to Missing
# select rows where y is 1 and recode to missing NA 
mydata3$y[mydata3$y == 1] <- NA

#Excluding Missing Values from Analyses
mean(y)#returns NA as it includes missing values
mean(y, na.rm = TRUE) #2+3/2

#returns a list rows of data that have missing values 
mydata3[!complete.cases(mydata3),]

#Data Values
# use as.Date( ) to convert strings to dates 
mydates <- as.Date(c("2007-06-22","1994-07-24"))
#number of days between the prevous dates
days <- mydates[1] - mydates[2]

# convert date info in format 'mm/dd/yyyy'
strDates <- c("01/05/1965", "08/16/1975")
dates <- as.Date(strDates, "%m/%d/%Y")

