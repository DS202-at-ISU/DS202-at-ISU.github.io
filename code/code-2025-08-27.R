x <- c(4, 1, 3, 9)
y <- c(1, 2, 3, 5)
x + y
x - y
(x - y)^2
sum((x - y)^2)
sqrt(sum((x - y)^2))

head(mtcars)
?sqrt
?sum
?mtcars

library(remotes)
remotes::install_github("heike/classdata", force = TRUE)

library(classdata)
head(fbi)
View(fbi)

1:5
2:10
fbi[1:5, 3:4]
fbi[c(1, 3, 5) , c(2, 4)]
fbi[, c(2,4)]
fbi[1:5, ]

num_vec <- c(1, 2, 3)
char_vec <- c('apple', 'banana', 'cherry')
bool_vec <- c(TRUE, FALSE, TRUE)

num_vec[c(FALSE, TRUE, TRUE)]
char_vec[c(FALSE, FALSE, TRUE)]
char_vec[bool_vec]

num_vec > 2
num_vec >= 2
num_vec[num_vec >= 2]

View(fbi[fbi$count > 500, ])
head(fbi[fbi$year > 2000, ])

fbi[, c("population", "type")]
dim(fbi)
dim(fbi[, c("population", "type")])
dim(fbi$population)
dim(fbi[, "population"])

head(fbi, 10)
summary(fbi)
str(fbi)

range(fbi$population)
min(fbi$population)
max(fbi$population)
mean(fbi$population)

dim(fbi)
str(fbi)
nrow(fbi)
ncol(fbi)

head(fbi, 10)
mean(fbi$count)
x <- c(1,2,3,4,NA)
mean(x, na.rm = TRUE)

mean(fbi$count, na.rm = TRUE)
sd(fbi$count, na.rm = TRUE)

homicide_vec <- 
  fbi[fbi$type == 'homicide', "count"]
mean(homicide_vec)
sd(homicide_vec)

x == 1
x > 1
x <= 1
x != 1

fbi$ratio <- fbi$count / fbi$population * 10000
View(fbi)

will <- list(
  name = 'Will',
  age = 28,
  lives_in_Ames = TRUE
)
will


for (i in 1:10) {
  print(i)
}

eulid_d <- function(x, y) {
  result <- sqrt(sum((x - y)^2))
  return(result)
}
y
x <- c(2, 4, 6, 8)
eulid_d(x, y)
# this is a comment
# x <- <- < <- <- <- <- <- <- <- <- <- 




