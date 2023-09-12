library(classdata)
library(tidyverse)

ggplot(aes(x = year, y = homicide), data=fbiwide) +
  facet_wrap(~state, ncol = 11) +
  geom_point()

fbiwide %>% 
  ggplot(aes(x = year, y = homicide)) +
  geom_point() +
  facet_wrap(~state, ncol = 11)

fbi %>% ggplot(aes(x=year, y =count)) +
  geom_point() +
  facet_grid(type ~ .)

fbi %>% ggplot(aes(x=year, y =count)) +
  geom_point() +
  facet_wrap(~ type, nrow = 9)

fbiwide %>% 
  ggplot(aes(x = year, 
             y = motor_vehicle_theft)) +
  geom_point() +
  facet_wrap(~ state)

fbiwide %>% 
  ggplot(aes(x = year, 
             y = log(motor_vehicle_theft))) +
  geom_point() +
  facet_wrap(~ state)

?facet_wrap

fbiwide %>% 
  ggplot(aes(x = year, 
             y = motor_vehicle_theft)) +
  geom_point() +
  facet_wrap(~ state,
             scales = 'free_y')

ggplot(data = fbi, 
       aes(x = type, y = log10(count))) +
  geom_boxplot() +
  coord_flip() +
  ggtitle("boxplot for crime types, log10 of count")

fbiwide %>% 
  ggplot(aes(x=state, y=robbery)) +
  geom_boxplot() +
  coord_flip()

fbiwide %>% 
  ggplot(aes(x=state, y=log(robbery))) +
  geom_boxplot() +
  coord_flip()

fbiwide %>% 
  ggplot(aes(x=state, y=robbery/population)) +
  geom_boxplot() +
  coord_flip()

fbiwide$robbery_rate <- 
  fbiwide$robbery / fbiwide$population
fbiwide %>% 
  ggplot(aes(x=state, y=robbery_rate)) +
  geom_boxplot() +
  coord_flip()

ggplot(fbiwide, aes(x = motor_vehicle_theft)) + 
  geom_histogram(binwidth=5000) +
  ggtitle("binwidth = 5000")

ggplot(fbiwide, aes(x = robbery)) + 
  geom_histogram(binwidth=5000) +
  ggtitle("binwidth = 5000")


ggplot(fbiwide, aes(x = robbery)) + 
  geom_histogram(binwidth=100) +
  ggtitle("binwidth = 100")


ggplot(fbi, aes(x = type)) + 
  geom_bar(aes(weight= count)) +
  coord_flip()
fbi %>% group_by(type) %>% 
  summarise(
    total_count = sum(count, na.rm =TRUE)
  )

fbi %>% 
  ggplot(aes(x = violent_crime, weight = count)) +
  geom_bar()

fbi %>% 
  ggplot(aes(x = violent_crime, weight = count)) +
  geom_bar() +
  facet_wrap(~type)

fbi %>% 
  ggplot(aes(x = violent_crime, 
             weight = count,
             fill = type)) +
  geom_bar()
  # facet_wrap(~type)

fbi %>% 
  ggplot(aes(x = count)) +
  geom_histogram() +
  facet_wrap(~type, scales = 'free_x')






