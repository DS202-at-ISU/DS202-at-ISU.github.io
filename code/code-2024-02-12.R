library(ggplot2)
library(classdata)

head(fbiwide)
str(fbiwide)

# example for `facet_wrap`
ggplot(fbiwide,
       aes(x = year, y = motor_vehicle_theft)) +
  geom_point() +
  facet_wrap(~ state)

# example for `facet_grid`
# this is a bad example, all states are stacked in one column
ggplot(fbiwide,
       aes(x = year, y = motor_vehicle_theft)) +
  geom_point() +
  facet_grid(. ~ state)

# example for `facet_grid`
# this is a bad example, all states are stacked in one row
ggplot(fbiwide,
       aes(x = year, y = motor_vehicle_theft)) +
  geom_point() +
  facet_grid(state ~ .)

# apply a log transformation to `motor_vehicle_theft`
ggplot(fbiwide,
       aes(x = year, y = log(motor_vehicle_theft))) +
  geom_point() +
  facet_wrap(~ state)

# check the documentation of `facet_wrap`
?facet_wrap

# use `scales = 'free_y'` for free y axis
ggplot(fbiwide,
       aes(x = year, y = motor_vehicle_theft)) +
  geom_point() +
  facet_wrap(~ state, scales = "free_y")

# instead of faceting, another option is to map `state` to color
# in order to include three variables in one plot
ggplot(fbiwide,
       aes(x = year, 
           y = motor_vehicle_theft,
           color = state)) +
  geom_point()
  
# an example of the boxplot
ggplot(data = fbi, aes(x = type, y = log10(count))) +
  geom_boxplot() +
  coord_flip() # for better readability

# recall: the aesthetic mapping `aes()` can also be used in 
# the geom_*() layer
ggplot(data = fbi) +
  geom_boxplot(aes(x = type, y = log10(count))) +
  coord_flip()

# an example of boxplot using R's base function
data <- 1:100
boxplot(data)

ggplot(data = fbiwide,
       aes(x = state, y = robbery)) +
  geom_boxplot() +
  coord_flip()

# adjust the robbery by population
ggplot(data = fbiwide,
       aes(x = state, y = robbery/population)) +
  geom_boxplot() +
  coord_flip()

# an example of histogram using R's base function
data
hist(data)
data <- rnorm(100) # draw 100 standard normal samples
hist(data)

# histogram with ggplot2
ggplot(fbiwide, aes(x = motor_vehicle_theft)) + 
  geom_histogram(binwidth=100000) +
  ggtitle("binwidth = 100000")





