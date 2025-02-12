library(ggplot2)
library(classdata)

View(fbiwide)

ggplot(
  fbiwide,
  aes(x = burglary, y = motor_vehicle_theft)
) +
  geom_point()

ggplot(
  fbiwide,
  aes(x = log(burglary), 
      y = log(motor_vehicle_theft))
) +
  geom_point()

ggplot(
  fbiwide,
  aes(x = sqrt(burglary), 
      y = motor_vehicle_theft + 100)
) +
  geom_point()

ggplot(
  fbiwide,
  aes(x = log(burglary), 
      y = log(motor_vehicle_theft),
      color = state)
) +
  geom_point() +
  theme(legend.position = "none")

ggplot(
  fbiwide,
  aes(x = log(burglary), 
      y = log(motor_vehicle_theft),
      size = population)
) +
  geom_point()

ggplot(
  fbiwide,
  aes(x = log(burglary), 
      y = log(motor_vehicle_theft),
      size = population,
      color = state)
) +
  geom_point() + 
  theme(legend.position = "none")

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

ggplot(
  df,
  aes(x = x, y = y)
) +
  geom_point()

ggplot(
  df,
  aes(x = x, y = y,
      color = type)
) +
  geom_point()

ggplot(
  df,
  aes(x = x, y = y,
      color = sign)
) +
  geom_point()

ggplot(
  df,
  aes(x = x, y = y)
) +
  geom_point() +
  facet_wrap(~type)

ggplot(
  df,
  aes(x = x, y = y, 
      color = type)
) +
  geom_point() +
  facet_wrap(~type)

ggplot(
  df,
  aes(x = x, y = y, 
      color = type)
) +
  geom_point() +
  facet_wrap(~sign)


ggplot(
  df,
  aes(x = x, y = y)
) +
  geom_point() +
  facet_grid(sign ~ type)

ggplot(
  df,
  aes(x = x, y = y)
) +
  geom_point() +
  facet_wrap(~ type)

ggplot(
  df,
  aes(x = x, y = y)
) +
  geom_point() +
  facet_grid(. ~ type)

ggplot(
  df,
  aes(x = x, y = y)
) +
  geom_point() +
  facet_grid(type ~ .)

ggplot(
  df,
  aes(x = x, y = y, 
      color = type)
) +
  geom_point()

ggplot(
  fbiwide,
  aes(x = year, y = motor_vehicle_theft)
) +
  geom_point() +
  facet_wrap(~state, 
             scales = 'free_y')

View(fbi)

ggplot(
  fbi,
  aes( x = type, y = count)
) +
  geom_boxplot()

ggplot(
  fbi,
  aes( x = type, y = log(count))
) +
  geom_boxplot() +
  coord_flip()

ggplot(
  fbiwide,
  aes(x = state,
      y = log(robbery))
) +
  geom_boxplot() +
  coord_flip()

fbiwide$robbery_rate <- 
  fbiwide$robbery / fbiwide$population
ggplot(
  fbiwide,
  aes(x = state, y = robbery_rate)
) +
  geom_boxplot() +
  coord_flip()





