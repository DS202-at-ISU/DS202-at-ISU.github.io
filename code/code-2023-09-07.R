library(classdata)
library(tidyverse)

?fbi

head(fbi)
tail(fbi)
dim(fbi)

summary(fbi)
str(fbi)

fbi$population  # this is an object too!

fbiwide







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
  geom_bar(aes(x = state, y = total_count), stat = 'identity')

# Is population correlated to the number of crime?
fbi %>% 
  filter(year == 2020) %>% 
  group_by(state, population) %>% 
  summarise(
    total_count = sum(count, na.rm = TRUE)
  ) %>% 
  ggplot() +
  geom_point(aes(x = population, y = total_count))
