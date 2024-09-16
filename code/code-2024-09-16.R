library(classdata)

head(fbi, 10)
fbi$count
mean(fbi$count)
sd(fbi$count)

mean(fbi$count, na.rm = TRUE)
sd(fbi$count, na.rm = TRUE)

?fbiwide
head(fbiwide)
str(fbiwide)

# load ggplot2 after you install it
library(ggplot2)
ggplot(data = fbiwide, 
       aes(x = burglary, y = homicide)) +
  geom_point()
# ggplot()
# data = fbiwide
# aes(x = ..., y = ...)
# geom_point()

ggplot(data = fbiwide, 
       aes(x = larceny, y = motor_vehicle_theft)) +
  geom_point()

ggplot(data = fbiwide, 
       aes(x = log(burglary)*2/3+100, y = log(homicide))) +
  geom_point()

ggplot(data=fbiwide, 
       aes(
         x = log(burglary), 
         y = log(motor_vehicle_theft),
         colour=state
       )
) + 
  geom_point()

mydata <- data.frame(
  x = 1:10,
  y = sample(10, 10),
  type = c(rep(c('a', 'b'), 4), 'a', 'a')
)
ggplot(data = mydata, 
       aes(
         x = x,
         y = y,
         # color = type
       )) +
  geom_point() +
  geom_line()

ggplot(data = mydata, 
       aes(
         x = x,
         y = y,
         color = type
       )) +
  geom_point() +
  geom_line() +
  theme(legend.position = "none")

# histogram
ggplot(data = mydata,
       aes(
         x = y
       )) +
  geom_histogram(binwidth = 1.5)

# bar chart
ggplot(data = mydata,
       aes(x = type)) +
  geom_bar()

ggplot(data = mydata,
       aes(x = type)) +
  geom_bar()

ggplot(data = mydata) +
  geom_col(aes(
    x = x, y = y
  )) +
  geom_line(aes(
    x = x,
    y = y
  ))






