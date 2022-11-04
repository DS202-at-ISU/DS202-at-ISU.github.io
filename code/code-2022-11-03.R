#install.packages("GGally")

data(nasa, package="GGally")
head(nasa)

nasa %>%
  ggplot(aes(x = date, y = temperature)) + 
  geom_point()

nasa %>%
  filter(y == 1) %>%
  ggplot(aes(x = date, y = temperature, colour=factor(x))) + 
  geom_point()

###
nasa %>% 
  filter( y ==1, x ==1) %>%
  ggplot(aes(x = date, y = temperature)) + 
  geom_point()

nasa %>% 
  filter( y ==1, x ==1) %>%
  ggplot(aes(x = date, y = temperature)) + 
  geom_line()

nasa %>% 
  filter( y ==1) %>%
  ggplot(aes(x = date, y = temperature, group=id)) + 
  geom_line()

#########
# Load the nasa data from the package GGally,

data(nasa, package="GGally")

#for one location, draw a time line of Ozone over the time frame (date).

nasa %>% 
  filter(id == "4-16") %>%
  ggplot(aes(x = date, y = pressure)) +
  geom_line()

nasa %>% 
  ggplot(aes(x = date, y = pressure, group=id)) +
  geom_line()


# Plot separate lines for each of the years, i.e. put month on the x-axis and ozone on the y-axis for the same location. Is there a seasonal pattern apparent?
  
#  Pick a location with x in 1:10 and y in 7:10. Plot temperature over time. Comment on the result.
nasa %>% 
  ggplot(aes(x = date, y = temperature, group=id)) +
  geom_line(alpha=0.1)

# x in 1:10 and y in 7:10

nasa %>% 
  filter(x %in% 1:10, y %in% 7:10) %>%
  ggplot(aes(x = date, y = temperature, group=id)) +
  geom_line()

##########
library(tidyverse)
# install.packages("maps")
library(maps)
states <- map_data("state")
states %>% ggplot(aes(x = long, y=lat)) + geom_point()
