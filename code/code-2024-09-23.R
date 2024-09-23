library(ggplot2)
library(classdata)

str(fbiwide)

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

ggplot(data = mydata, 
       aes(
         x = x,
         y = y,
         color = type
       )) +
  geom_point() +
  geom_line()

ggplot(data = mydata, 
       aes(
         x = x,
         y = y
       )) +
  facet_wrap(~type) +
  geom_point() +
  geom_line()


ggplot(data = fbiwide, 
       aes(
         x = year,
         y = motor_vehicle_theft
       )) +
  geom_line() +
  facet_wrap(~ state)

ggplot(data = fbiwide, 
       aes(
         x = year,
         y = motor_vehicle_theft
       )) +
  geom_line() +
  facet_wrap(~ state,
             scales = 'free_y')

ggplot(data = fbiwide, 
       aes(
         x = year,
         y = motor_vehicle_theft,
         color = state
       )) +
  geom_line()
  # facet_wrap(~ state,
  #            scales = 'free_y')


ggplot(data = fbi,
       aes(
         x = type,
         y = log(count)
       )) +
  geom_boxplot() +
  coord_flip()

mydata
ggplot(data = mydata,
       aes(
         x = type,
         y = y
       )) +
  geom_boxplot() +
  coord_flip()
  
ggplot(data = fbiwide,
       aes(
         x = state,
         y = robbery
       )) +
  geom_boxplot() +
  coord_flip()

ggplot(data = fbiwide,
       aes(
         x = state,
         y = robbery/population
       )) +
  geom_boxplot() +
  coord_flip()

# the second option
fbiwide$rate_robbery <- 
  fbiwide$robbery / fbiwide$population
ggplot(data = fbiwide,
       aes(
         x = state,
         y = rate_robbery
       )) +
  geom_boxplot() +
  coord_flip()



ggplot(fbiwide, aes(x = motor_vehicle_theft)) + 
  geom_histogram(binwidth=5000) +
  ggtitle("binwidth = 5000")

ggplot(fbiwide, aes(x = motor_vehicle_theft)) + 
  geom_histogram(binwidth=1000) +
  ggtitle("binwidth = 1000")

ggplot(fbiwide, aes(x = motor_vehicle_theft)) + 
  geom_histogram(binwidth=1000) +
  ggtitle("binwidth = 1000") +
  facet_wrap(~state)







