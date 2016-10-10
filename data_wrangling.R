# CHEECK THE SHEET CHEAT OF DATA WRANGLING FROM RSTUDIO
# What is 'Tidy Data'?
  # 'tidyr' is the package that was created to help getting your data in right formate for Rstudio 
library(tidyr)
#it has 2 main function gather() & spread()
install.packages("devtools")
devtools::install_github("rstudio/EDAWR")
library(EDAWR)
gather(cases, "year", "n", 2:4) #now cases table is in the rright formatfor Rstudio
spread(pollution, size, amount)
storms2 <- separate(storms, date,c("year","month","day"), sep = "-")
storms3 <- unite(storms2,"date", year,month,day,sep="-")

####################################################
  #dplyr
library(dplyr)
library(nycflights13)
select(storms, storm, pressure)
select(storms, -storm) #select evry col in storms except 'storm'
select(storms, wind:date) #select cols from wind to date
#filter takes a logical condition
filter(storms, wind >= 50) #colmns that wind >= 50
filter(storms, wind >= 50, storm %in% c("Alberto", "Alex", "Allison")) #you can combine 2 logical conditions
mutate(storms, ratio = pressure / wind, inverse = ratio^-1) #creates ratio & inverse columns, it does not change the original data frame
pollution %>% summarize(median = median(amount),variance = var(amount)) #return a dataframe of 2 cols 'variance' and 'median'
arrange(storms, wind) # arrange storm based on wind intensity value
arrange(storms, desc(wind))
arrange(storms, wind, date)
####################################################

#The pipe operator' %>% 'in the dyplr libaray
#you can write %>% : ctrl+shift+m

select(storms, wind, date) #is equivalent to
storms %>% select(wind, date) 

diamonds$x %>% round(2) %>% mean() #is equivalent to, note round(2) means to round the decimal number to the 2 decimal places
d2 <- round(diamonds$x, 2)
mean(d2)

storms %>%
  filter(wind >= 50) %>%
  select(storm, pressure)

storms %>%
  mutate(ratio = pressure / wind) %>%
  select(storm, ratio)

pollution %>% 
  group_by(city) %>% #calculate the mean and variance of pollution data according to city 
  summarize(mean= mean(amount), variance= var(amount))

pollution %>% group_by(size) %>% summarize(mean=mean(amount))
pollution %>% ungroup() #to discard these meta data from memory

#####################################################
library(babynames) # data package
library(dplyr)     # provides data manipulating functions.
library(magrittr)  # ceci n'est pas un pipe
library(ggplot2)   # for graphics

babynames %>%
  filter(name %>% substr(1, 3) %>% equals("Ste")) %>%
  group_by(year, sex) %>%
  summarize(total = sum(n)) %>%
  qplot(year, total, color = sex, data = ., geom = "line") %>%  # note the data = . argument. This tells %>% to place the left-hand side there
  add(ggtitle('Names starting with "Ste"')) %>%
  print

# 1. take the baby data, then
# 2.   filter it such that the name sub-string from character 1 to 3 equals "Ste", then
# 3.   group it by year and sex, then
# 4.   summarize it by computing total sum for each group, then
# 5.   plot the resuls, coloring by sex, then
# 6.   add a title, then
# 7.   print it to the canvas.
##########################################################
 
# joining data
# dplyr::bind_cols()
a <- data.frame(x1= c("A","B","C"), x2=c(1,2,3))
b <- data.frame(x1= c("B","C","D"), x2=c(2,3,4))
bind_cols(a,b)
bind_rows(a,b)
union(a, b)
intersect(a,b)
setdiff(a,b)

