library(ggplot2)
library(classdata)

View(fbiwide)

ggplot(fbiwide,
       aes(x = state, y = log(robbery))) +
  geom_boxplot() +
  coord_flip()

fbiwide$robbery_rate <- 
  fbiwide$robbery / fbiwide$population
ggplot(fbiwide,
       aes(x = state, y = robbery_rate)) +
  geom_boxplot() +
  coord_flip()

ggplot(fbiwide, aes(x = motor_vehicle_theft)) + 
  geom_histogram(binwidth=5000) +
  ggtitle("binwidth = 5000")

ggplot(fbiwide, aes(x = motor_vehicle_theft)) + 
  geom_histogram(binwidth=50) +
  ggtitle("binwidth = 5000")

ggplot(fbiwide, aes(x = motor_vehicle_theft)) + 
  geom_histogram(binwidth=500000) +
  ggtitle("binwidth = 5000")


ggplot(fbiwide, aes(x = motor_vehicle_theft)) + 
  geom_histogram() +
  ggtitle("binwidth = 5000")

df <- data.frame(
  type = c('a', 'a', 'a', 
           'b', 'b', 'c'),
  count = c(10, 2, 5, 30, 20, 100)
)
ggplot(df,
       aes(x = type)) +
  geom_bar()
ggplot(df,
       aes(x = type)) +
  geom_bar(aes(weight = count))

ggplot(fbi,
       aes(x = violent_crime,
           weight = count)) +
  geom_bar() +
  facet_wrap(~type)

ggplot(fbi,
       aes(x = violent_crime,
           weight = count,
           fill = type)) +
  geom_bar()

ggplot(fbi,
       aes(x = count)) +
  geom_histogram() +
  facet_wrap(~type, 
             scales = "free_y")

df2 <- data.frame(
  x = c(1,2,3,4),
  y = c(4,3,2,1),
  z = c(2,3,1,4)
)
ggplot(df2,
       aes(x = x, y = y)) +
  geom_point() +
  geom_line()
ggplot(df2) +
  geom_point(aes(x = x, y = y)) +
  geom_line(aes(x = x, y = z))

TRUE
FALSE
if (TRUE) {
  print("hello world!")
}
TRUE + TRUE
TRUE + FALSE
TRUE - TRUE
logical_vec <- c(TRUE, TRUE, FALSE)
logical_vec
sum(logical_vec)

x <- c(1,2,3,4,5,6)
sum(x > 3)
x %in% c(1,3,5,7)
x > 3 & x < 5
x > 3 | x < 5
TRUE & TRUE
TRUE & FALSE
FALSE & FALSE

TRUE | TRUE
TRUE | FALSE
FALSE | FALSE

c(TRUE, TRUE, FALSE) & c(TRUE, FALSE, FALSE)

a <- c(1, 15, 3, 20, 5, 8, 9, 10, 1, 3)

# less than 20
a < 20

# squared value is at least 100 or less than 10
(a^2 >= 100) | (a^2 < 10)

# equals 1 or 3 or 5 or 10
a == 1 | a == 3 | a == 5 | a == 10
a %in% c(1, 3, 5, 10)

# even
a %% 2 == 0

# restart R session

library(classdata)
dplyr::filter(fbi, year == 2014)

library(dplyr)
dplyr::filter(fbi, year == 2014)

# yourturn-checkin-2
library(dplyr)
library(classdata)
library(ggplot2)

crime_iowa <- filter(fbi, state == 'Iowa',
                     type == 'robbery')
ggplot(crime_iowa,
       aes(x = year,y = count)) +
  geom_line()

