y <- c(1, 4, 2, 5)
y[2]

x <- c(4, 1, 3, 9)
y <- c(1, 2, 3, 5)

sqrt(sum((x - y)^2))
?sum

x
summary(x)
m <- lm(y~x)
summary(m)

str(x)
str(m)

dim(x)
mm <- matrix(x, 2, 2)
dim(mm)

library(classdata)
library(tidyverse)
fbi
dim(fbi)

str(fbi)
fbi <- as_tibble(fbi)

fbi$state

fbi[ , c("state", "state_id", "population")]
1:10

fbi[1:5, 2:3]
fbi[c(1,2,3,4,5), c(2,3)]

fbi[c(1,4,5), c(2,4)]

dim(fbi)
dim(fbi$state)
fbi$state[1:5]

fbi$population
mean(fbi$population)
median(fbi$population)
quantile(fbi$population)

range(fbi$population)
sd(fbi$population)
var(fbi$population)

fbi[1:10 , ]
head(fbi, 10)

head(10)
10




