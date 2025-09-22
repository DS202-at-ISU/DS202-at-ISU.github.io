x <- c(2, 4, 5)
x <= 10
x >= 3
x == 4
x != 2
x %in% c(1,2,3)

a <- c(1, 15, 3, 20, 5, 8, 9, 10, 1, 3)
a < 20
(a^2 >= 100) | (a^2 < 10)
(a == 1) | (a == 3)
a %in% c(1, 3)
a %% 2 == 0

library(dplyr)
dplyr::filter

library(classdata)
library(ggplot2)
iowa_larceny_data <- filter(fbi,
                            state == "Iowa", 
                            type == 'larceny')
iowa_larceny_data$rate <- 
  iowa_larceny_data$count / iowa_larceny_data$population
ggplot(iowa_larceny_data,
       aes(x = year, y = rate)) +
  geom_line()

larceny_2020 <- filter(fbi,
                       year == 2020,
                       type == 'larceny')
larceny_2020$rate <- 
  larceny_2020$count / larceny_2020$population
ggplot(larceny_2020, 
       aes(x = state_abbr,
           y = rate)) +
  geom_col() +
  coord_flip()

range(fbi$year)

data <- filter(fbi, 
               type == 'homicide',
               year %in% c(2016, 2017, 2018, 2019, 2020))
data$rate <- data$count / data$population
threshold <- quantile(data$rate, 0.9)
data_plot <- filter(data, 
                    rate > threshold) 
ggplot(data_plot,
       aes(x = state_abbr, y = rate)) +
  geom_col()

ggplot(filter(data, rate > quantile(data$rate, 0.9)),
       aes(x = state_abbr, y = rate)) +
  geom_col()

which( a ==  1)
which(a > 5)
which(fbi$type == 'homicide')
max(a)
which.max(a)

which.max(fbi$population)
fbi[1864, ]


d1 <- filter(fbi, type == "burglary", 
       state_abbr == "CA")
sum(d1$count)

d2 <- filter(fbi, violent_crime == TRUE,
             year == 1980)
d2$rate <- d2$count / d2$population
d2[which.max(d2$rate), c("type", "rate")]

d3 <- filter(fbiwide,
             year == 2011)
d3$state[d3$motor_vehicle_theft > d3$robbery]




