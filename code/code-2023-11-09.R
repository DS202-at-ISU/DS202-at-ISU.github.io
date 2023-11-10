library(tidyverse)

counties <- map_data("county")

counties %>% 
  ggplot(aes(x = long, y = lat)) +
  geom_path(aes(group = group))

counties %>% 
  ggplot(aes(x = long, y = lat)) +
  geom_polygon(aes(group = group))

counties %>% 
  mutate(
    call_story = subregion == 'story'
  ) %>% 
  ggplot(aes(x = long, y = lat)) +
  geom_polygon(aes(group = group, fill = call_story))

###

data(fbi, package="classdata")

fbi14 <- fbi %>% filter(year == 2014)
head(fbi14)

states <- map_data("state")

fbi14$region <- tolower(fbi14$state)

# some regions in fbi14 cannot be found in states
nomatch1 <- fbi14 %>% anti_join(states, by="region")

# all regions in states can be found in fbi14
nomatch2 <- states %>% anti_join(fbi14, by='region')

fbi.map <- fbi14 %>% left_join(states, by = 'region')

fbi.map %>% filter(type=="burglary") %>% 
  ggplot(aes(x = long, y = lat, 
             fill=count/population*100000)) +
  geom_polygon(aes(group=group))

fbi.map.mvt <- 
  fbi %>% 
  filter(year == 2020) %>% 
  mutate(
    region = tolower(state)
  ) %>% 
  left_join(states, by = 'region')

fbi.map.mvt %>% 
  mutate(rate = count / population * 100000) %>% 
  pull(rate) %>% 
  unique() %>% 
  median(na.rm = TRUE)

fbi.map.mvt %>% 
  filter(type == 'motor_vehicle_theft') %>% 
  ggplot(aes(x = long, y = lat,
             fill = count / population * 100000)) +
  geom_polygon(aes(group = group)) +
  scale_fill_gradient2(midpoint = 300) +
  ggthemes::theme_map()


#######
library(rvest)
# install.packages("rvest")
url <- "https://en.wikipedia.org/wiki/2023_Baseball_Hall_of_Fame_balloting"
html <- read_html(url)
html

tables <- html %>% html_table(fill=TRUE)
class(tables)


###





