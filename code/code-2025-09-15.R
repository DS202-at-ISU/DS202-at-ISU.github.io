library(ggplot2)
library(classdata)

library(dplyr)
df1 <- data.frame(
  x = seq(-1, 1, 0.1),
  type = 'up'
)
df1$y <- df1$x
df2 <- data.frame(
  x = seq(-1, 1, 0.1),
  type = 'down'
)
df2$y <- -df2$x
df <- rbind(df1, df2)
df <- df %>% mutate(
  sign = if_else(y >= 0, 'positive', 'negative')
)

View(df)

ggplot(df, 
       aes(x = x, y = y,
           color = type)) +
  facet_wrap(~ sign) +
  geom_point()

ggplot(df, aes(x = x, y = y)) +
  geom_point() +
  facet_grid(type ~ sign)

ggplot(df, aes(x = x, y = y)) +
  geom_point() +
  facet_grid(type ~ .)

ggplot(df, aes(x = x, y = y)) +
  geom_point() +
  facet_wrap(~ type)

ggplot(fbiwide,
       aes(x = year, y = log(motor_vehicle_theft))) +
  facet_wrap(~ state_abbr,
             scales = "free_y") +
  geom_line()

ggplot(fbiwide,
       aes(x = state_abbr,
           y = robbery)) +
  geom_boxplot() +
  coord_flip()

fbiwide$robbery_rate <- 
  fbiwide$robbery / fbiwide$population
ggplot(fbiwide,
       aes(x = state_abbr,
           y = robbery_rate)) +
  geom_boxplot() +
  coord_flip()

ggplot(fbiwide, aes(x = motor_vehicle_theft)) + 
  geom_histogram(binwidth=1000) +
  ggtitle("binwidth = 1000")
ggplot(fbiwide, aes(x = motor_vehicle_theft)) + 
  geom_histogram(binwidth=5000) +
  ggtitle("binwidth = 5000")
ggplot(fbiwide, aes(x = motor_vehicle_theft)) + 
  geom_histogram(binwidth=1000000) +
  ggtitle("binwidth = 1000000")
ggplot(fbiwide, aes(x = motor_vehicle_theft)) + 
  geom_histogram(binwidth=1) +
  ggtitle("binwidth = 1")
ggplot(fbiwide, aes(x = motor_vehicle_theft)) + 
  geom_histogram() +
  ggtitle("not specify the binwidth")


df3 <- data.frame(
  class = c(
    rep("a", 3),
    rep("b", 4),
    rep("c", 5)
  )
)
ggplot(df3, aes(x = class)) +
  geom_bar()

df4 <- data.frame(
  class = c('a', 'b', 'c'),
  count = c(3, 4, 5)
)
ggplot(df4, aes(x = class)) +
  geom_bar(aes(weight = count))
ggplot(df4, aes(x = class, y = count)) +
  geom_col() +
  ggtitle("geom_col example")

ggplot(fbi,
       aes(x = violent_crime)) +
  geom_bar(aes(weight = count)) +
  facet_wrap(~ type)

ggplot(fbi,
       aes(x = violent_crime,
           fill = type)) +
  geom_bar(aes(weight = count))

ggplot(fbi, 
       aes(x = count)) +
  geom_histogram() +
  facet_wrap(~ type,
             scales = "free_y")














