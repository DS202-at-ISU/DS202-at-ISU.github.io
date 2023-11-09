library(tidyverse)
# install.packages("Lahman")
library(Lahman)

HallOfFame_players <- HallOfFame %>% 
  filter(yearID == 2018,
         inducted == 'Y',
         votedBy == 'BBWAA') %>% 
  pull(playerID)

People %>% 
  filter(playerID %in% HallOfFame_players)

###
joined_data <- left_join(HallOfFame, People,
                         by = 'playerID')
joined_data <- HallOfFame %>% 
  left_join(People, by = 'playerID')

joined_data %>% 
  filter(inducted == 'Y',
         deathYear > 2018 | is.na(deathYear))

###
joined_data %>% 
  filter(nameLast == 'Sosa')

###
counties <- map_data("county")
counties %>% 
  ggplot(aes(x = long, y = lat, group = group)) +
  geom_path()

counties %>% 
  ggplot(aes(x = long, y = lat, group = group)) +
  geom_polygon()

counties %>% 
  ggplot() +
  geom_polygon(aes(x = long, y = lat, group = group))


