library(classdata)
library(ggplot2)
# remotes::install_github("heike/classdata")

mydata <- data.frame(
  height = 1:6,
  weight = (1:6)^2
)
mydata

ggplot(
  data = mydata,
  mapping = aes(x = height, y = weight)
) +
  geom_point() + # the second layer
  geom_line(color = 'red') # the third layer

ggplot(
  data = mydata,
  mapping = aes(x = height, y = weight)
) +
  geom_line() +
  geom_point(color = 'red')

View(fbiwide)
str(fbiwide)

ggplot(data = fbiwide, aes(x = burglary, y = homicide)) +
  geom_point()

ggplot(data = fbiwide, aes(x = log(burglary), y = log(homicide))) +
  geom_point()

ggplot(
  aes(x = log(burglary), 
      y = log(motor_vehicle_theft),
      colour=state), 
  data=fbiwide
) + 
  geom_point()

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

ggplot(df, aes(x = x, y = y,
               color = type)) +
  geom_point() +
  facet_wrap(~ type)

ggplot(df, aes(x = x, y = y,
               color = type)) +
  geom_point() +
  facet_wrap(~ sign)

ggplot(df, aes(x = x, y = y)) +
  geom_point() +
  facet_grid(type ~ sign)

ggplot(df, aes(x = x, y = y)) +
  geom_point() +
  facet_grid(. ~ type)

ggplot(fbiwide,
       aes(x = year, y = log(motor_vehicle_theft))) +
  facet_wrap(~ state, ncol = 11) +
  geom_point()

ggplot(fbiwide,
       aes(x = year, y = motor_vehicle_theft)) +
  facet_wrap(~ state, ncol = 11,
             scales = 'free_y') +
  geom_point()

ggplot(df, aes(x = x, y = y, color = type)) +
  geom_point()

ggplot(df, aes(x = x, y = y)) +
  geom_point() +
  facet_wrap(~ type)

ggplot(data = fbi, 
       aes(x = type, y = log10(count))) +
  geom_boxplot() +
  coord_flip()

ggplot(data = fbiwide,
       aes(x = state, y = robbery)) +
  geom_boxplot() +
  coord_flip()

fbiwide$robbery_rate <- fbiwide$robbery / fbiwide$population * 100000
ggplot(data = fbiwide,
       aes(x = state, y = robbery_rate)) +
  geom_boxplot() +
  coord_flip()


ggplot(fbiwide, 
       aes(x = motor_vehicle_theft)) + 
  geom_histogram() 

ggplot(fbiwide, 
       aes(x = motor_vehicle_theft)) + 
  geom_histogram(binwidth = 100000000000) 

ggplot(fbiwide, 
       aes(x = motor_vehicle_theft)) + 
  geom_histogram(binwidth = 100) 

ggplot(fbiwide, 
       aes(x = motor_vehicle_theft)) + 
  geom_histogram(binwidth = 5000) 


ggplot(fbi, aes(x = type)) + 
  geom_bar()
sum(fbi$type == 'larceny')

ggplot(fbi, aes(x = type)) + 
  geom_bar(aes(weight = count)) +
  coord_flip()

#---------------------------------
df <- data.frame(
  type = c(rep("apple", 5),
           rep('pineapple', 2))
)

ggplot(df, aes(x = type)) +
  geom_bar()


ggplot(fbi,
       aes(x = violent_crime)) +
  geom_bar(aes(weight = count))

ggplot(fbi,
       aes(x = violent_crime)) +
  geom_bar(aes(weight = count)) +
  facet_wrap(~ type)

ggplot(fbi,
       aes(x = violent_crime, fill = type)) +
  geom_bar(aes(weight = count))

ggplot(fbi,
       aes(x = count)) +
  geom_histogram() +
  facet_wrap(~ type, scales = "free_y")








