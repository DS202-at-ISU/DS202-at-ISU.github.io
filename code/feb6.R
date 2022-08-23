a <- c( 1,3,10, 15, 6, 7, 8,3, 1)
foo <- a == 1

a %in% c(1,3)

a <- c(1,15, 3,20, 5,8,9,10, 1,3)
a < 20
a[a < 20]
a[(a^2 >= 100) | (a^2 < 10)]
b1 <- a %in% c(1,3)
b2 <- (a == 1) | (a == 3)

all(b1 == b2)
any(b1 != b2)
identical(b1, b2)

a[(a %% 2) == 0]
a %/% 2

######################
library(classdata)
names(fbi)
library(dplyr)
library(ggplot2)

iowa <- filter(fbi, State=="Iowa")
str(iowa)
ggplot(data=filter(iowa, Type=="Burglary"), 
       aes(x = Year, y=Count, colour=Type)) + 
  geom_point()

ggplot(data=filter(iowa, Type=="Burglary"), 
       aes(x = Year, y=Count/Population, colour=Type)) + 
  geom_point()
https://github.com/DS202-at-ISU/labs/blob/master/data/HAPPY.rds
