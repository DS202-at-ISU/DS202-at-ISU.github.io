library(classdata)
library(ggplot2)

str(fbi)
View(fbi)

ggplot(fbi, aes(x = type)) + 
  geom_bar(aes(weight= count)) +
  coord_flip()


tt1 <- data.frame(
  x = seq(-1, 1, 0.1), 
  type = 'a'
)
tt2 <- data.frame(
  x = seq(-1, 1, 0.1),
  type = 'b'
)
tt1$y <- tt1$x^2
tt2$y <- -tt2$x^2
mydata <- rbind(tt1, tt2)
View(mydata)

ggplot(mydata,
       aes(x = x, y = y,
           color = type)) +
  geom_line()

ggplot(mydata,
       aes(x = type)) +
  geom_bar()

ggplot(data = fbi,
       aes(x = violent_crime)) +
  geom_bar(aes(weight = count))

ggplot(data = fbi,
       aes(x = violent_crime)) +
  geom_bar(aes(weight = count)) +
  facet_grid(type ~ .) +
  coord_flip()

ggplot(data = fbi,
       aes(x = violent_crime, 
           fill = type)) +
  geom_bar(aes(weight = count))

ggplot(data = fbi,
       aes(
         x = count
       )) +
  geom_histogram() +
  facet_wrap(~ type, 
             scales = "free_y")

l1 <- c(TRUE, FALSE, FALSE)
l2 <- c(T, F, F)

# x <- c(1,2,3,4,5,6,7,8,9,10)
x <- 1:10
x > 5
x >= 5
x %in% c(1,4,5,11,15,6)

a <- c(1, 15, 3, 20, 5, 8, 9, 10, 1, 3)
a < 20
(a^2 >= 100) | (a^2 < 10)
FALSE | TRUE
TRUE | TRUE
TRUE | FALSE
FALSE | FALSE

TRUE & TRUE
FALSE & TRUE

(a == 1) | (a == 3) | (a == 5) | (a == 7)
a %in% c(1, 3, 5, 7)
a %% 2 == 0

library(dplyr)
dplyr::filter(fbi, year == 2014)
d1 <- filter(fbi, 
       type == "larceny", 
       state %in% c("Iowa", "Minnesota"))
View(d1)

d2 <- filter(fbi, 
       state == "Iowa",
       type == "motor_vehicle_theft")
ggplot(data = d2,
       aes(
         x = year,
         y = count
       )) +
  geom_line()


