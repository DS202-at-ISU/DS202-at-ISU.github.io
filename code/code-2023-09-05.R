library(tidyverse)

x <- c(4, 1, 3, 9)
y <- c(1, 2, 3, 5)

sqrt(sum((x - y)^2))
(x - y)^2 %>% sum() %>% sqrt()

# remotes::install_github("heike/classdata")
library(classdata)
?fbi
fbi

head(fbi)
summary(fbi)
str(fbi)

fbi$state
fbi[, 'state']
fbi[, c('state', 'year', 'count', 'violent_crime')]

fbi[c(1,2,3), ]
fbi[c(1,2,3), c('state', 'year')]

row <- c(1,2,3,4)
col <- c('state', 'year', 'count')
fbi[row, col]

fbi[fbi$violent_crime == TRUE, c('state', 'violent_crime')]
fbi[row, c(1,2,3)]

head(fbi)
fbi[1:10, ]
head(fbi, n = 10L)

fbi$count
mean(fbi$count)
sd(fbi$count)

vec_with_NA <- c(1,2,3, NA)
mean(vec_with_NA)
sd(vec_with_NA)

fbi_count_mean <- mean(fbi$count, na.rm = TRUE)
sd(fbi$count, na.rm = TRUE)


