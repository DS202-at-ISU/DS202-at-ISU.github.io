1 + 1
2 * 3
x <- 3
x + 2
1
sqrt(3)
sqrt(x)
y <- c(1, 4, 5, 2)
y[2]
y[1]
y[5]

2 * y
sum(y)

x = 3
x <- c(4, 1, 3, 9)
y <- c(1, 2, 3, 5)

x - y
(x - y)^2
sum((x - y)^2)
sqrt(sum((x - y)^2))

sub <- x - y
sqr <- sub^2
sum <- sum(sqr)
eu_dis <- sqrt(sum)
eu_dis

sqrt(sum((x - y)^2))

num_vec <- c(1, 2, 3)
char_vec <- c('apple', 'banana', 'cherry')
bool_vec <- c(TRUE, FALSE, TRUE)
char_vec2 <- c("apple", "banana", "cherry")

"I'm a string'"
vec <- c(1, 'a')
vec

mydata <- data.frame(
  num_vec,
  char_vec,
  bool_vec
)
mydata

?sum
?sqrt
?mtcars

install.packages("remotes")
library(remotes)
install_github("heike/classdata")
remotes::install_github()

# import numpy
library(numpy)

# from numpy import array
numpy::array

library(classdata)
1:5
1:10

mydata[c(1, 2), c(2, 3)]
mydata[c(TRUE, FALSE, FALSE), ]
bool_vec
mydata[bool_vec, ]
num_vec > 2
mydata[num_vec > 2, ]

mydata$num_vec
mydata[, c("num_vec")]
mydata[, c("num_vec", "char_vec")]
mydata[c(1, 3), c("num_vec", "char_vec")]

mydata$char_vec
mtcars$mpg

library(classdata)
head(fbi)
fbi[1:6, c("state", "year", "population", "type", "count")]
fbi$count
fbi[1:6, "count"]
fbi$count[1:6]

mydata
mtcars
fbi

head(mtcars)
head(fbi)
?head
head(fbi, n = 10)
summary(mtcars)
summary(fbi)
str(mtcars)
str(fbi)
dim(fbi)

View(fbi)

num_vec
min(num_vec)
max(num_vec)
mean(num_vec)
median(num_vec)
range(num_vec)
sd(num_vec)
var(num_vec)

num_vec2 <- c(1, 3, 2, 5, 6, 8, 9, 11, 13, 6, NA)
sum(num_vec2)
?sum
sum(num_vec2, na.rm = TRUE)

?mean
?median

fbi
