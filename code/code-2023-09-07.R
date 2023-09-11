library(classdata)
library(tidyverse)

?fbi

fbi_first10 <- head(fbi, n = 10)
tail(fbi)
dim(fbi)

summary(fbi)
str(fbi)

# this is a numeric vector
fbi$population  

# this is a dataframe with one column
fbi[ , 'population']

?fbiwide
dim(fbiwide)
str(fbiwide)

# version 1
ggplot(data = fbiwide, 
       aes(x = burglary, y = homicide)) +
  geom_point() + 
  geom_smooth()
# version 2
fbiwide %>% 
  ggplot(aes(x = burglary, y = homicide)) +
  geom_point() +
  geom_smooth()

ggplot(data = fbiwide, 
       aes(x = log(burglary), 
           y = log(homicide))) +
  geom_point()

ggplot(data = fbiwide, 
       aes(x = log(burglary), 
           y = log(motor_vehicle_theft))) +
  geom_point()

ggplot(aes(x = log(burglary), 
           y = log(motor_vehicle_theft),
           colour=state), 
       data=fbiwide) + 
  geom_point()

ggplot(aes(x = log(burglary), 
           y = log(motor_vehicle_theft),
           colour=factor(year)), 
       data=fbiwide) + 
  geom_point()

ggplot(aes(x = log(burglary), 
           y = log(motor_vehicle_theft),
           size=population, 
           color = year,
           shape = state), 
       data=fbiwide) + 
  geom_point() +
  theme(legend.position = "none")




# Which state has the highest number of homicides?
fbi %>% 
  filter(type == 'homicide') %>% 
  group_by(state) %>% 
  summarise(
    total_count = sum(count)
  ) %>% 
  arrange(desc(total_count)) %>% 
  head() %>% 
  within({
    state = factor(state, levels = state)
  }) %>%
  ggplot() +
  geom_bar(aes(x = state, y = total_count), 
           stat = 'identity')

# Is population correlated to the number of crime?
fbi %>% 
  filter(year == 2020) %>% 
  group_by(state, population) %>% 
  summarise(
    total_count = sum(count, na.rm = TRUE)
  ) %>% 
  ggplot() +
  geom_point(aes(x = population, y = total_count))
