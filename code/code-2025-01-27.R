
x <- c(4, 1, 3, 9)
y <- c(1, 2, 3, 5)

x - y
(x - y)^2
sum((x - y)^2)
sqrt(sum((x - y)^2))

num_vec <- c(1, 2, 3)
vec <- c(1, 'apple', TRUE)
vec
x
x[1]
x[2]
x[c(1,3)]

mydata <- data.frame(
  type = c("apple", "banana", "cherry"),
  size = c(1.2, 3.5, 6.4)
)
mydata
?sum
?sqrt
?mtcars

install.packages("remotes")
remotes::install_github("heike/classdata")

library(classdata)
?fbi

1:5
c(1,2,3,4,5)

mtcars[1:5, ]
mtcars[1:5, 1:3]
mtcars[1:5, c(1, 3, 5)]

mtcars$mpg
mtcars$am
mydata$type
mydata$size

fbi$state
fbi$population

head(fbi)
?head
head(fbi, 10)

summary(fbi)
dim(fbi)
str(fbi)

fbi$population
mean(fbi$population)
median(fbi$population)

fbi$count
mean(fbi$count, na.rm = TRUE)
?mean
x <- c(1, 4, 5, 7, NA)
mean(x, na.rm = TRUE)
sd(fbi$count, na.rm = TRUE)
?sd

head(fbi, 10)
fbi[1:10, ]
fbi[, ]

if (TRUE) {
  print("hello world!")
}

for (i in 1:4) {
  print(i)
}

foo <- function() {
  print("hello world!")
}
foo()

