x <- 2 / 3
# 1/3 -> y

sqrt(x)
sqrt(9)

y <- c(1, 4, 5, 2)
y[2]
y[c(2,3)]
y[c(2,1,4,3)]
y[c(-1,5)]

sum(y)
sum(y[c(1,3)])

x <- c(4, 1, 3, 9)
y <- c(1, 2, 3, 5)

x - y
# result <- c()
# for (i in 1:4) {
#   result[i] <- x[i] - y[i]
# }
# result
(x - y)^2
sum((x - y)^2)
sqrt(sum((x - y)^2))

t1 <- x - y
t2 <- t1^2
t3 <- sum(t2)
sqrt(t3)

?sum
help("sum")
# help("sqrt")
# ?sqrt
help.search("sum")
??sum
?help

install.packages("remotes")
remotes::install_github("heike/classdata")
library(classdata)

?fbi
fbi

head(fbi, 10)
summary(fbi)
str(fbi)
dim(fbi)

fbi$year
fbi$state
length(fbi$state)
fbi[, "state"]
fbi[c(1,2,3), "state"]
fbi[c(1,2,3), c("year" ,"state")]

fbi$state == "Iowa"
fbi[fbi$state == "Iowa", c("population", "year", "state")]

fbi[c(1,2,3), "state"]$state
fbi$state[c(1,2,3)]

mean(fbi$population)
median(fbi$population)
min(fbi$population)
max(fbi$population)

num <- c(2, 3, 4, NA)
mean(num)
mean(num, na.rm = TRUE)
median(num, na.rm = TRUE)
min(num, na.rm = TRUE)

range(fbi$population)
min(fbi$population)
max(fbi$population)

sd(fbi$population)
var(fbi$population)
sd(num)
sd(num, na.rm = TRUE)

x <- c(4, 1, 3, 9)
y <- c(1, 2, 3, 5)
cor(x, y)
cov(x, y)

