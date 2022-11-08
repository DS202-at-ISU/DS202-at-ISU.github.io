##########
library(tidyverse)
# install.packages("maps")
library(maps)
states <- map_data("state")
states %>% ggplot(aes(x = long, y=lat)) + geom_point()

states %>% ggplot(aes(x = long, y=lat)) + geom_line()
states %>% ggplot(aes(x = long, y=lat, group=group)) + 
  geom_line()

states %>% ggplot(aes(x = long, y=lat, group=group)) + 
  geom_path()

states %>% 
  filter(region=="michigan") %>%
  ggplot(aes(x = long, y=lat, group=group)) + 
  geom_path()

states %>% 
  filter(region=="michigan") %>%
  ggplot(aes(x = long, y=lat, group=group)) + 
  geom_polygon()

states %>% 
#  filter(region=="michigan") %>%
  ggplot(aes(x = long, y=lat, group=group)) + 
  geom_polygon()

states %>% 
  #  filter(region=="michigan") %>%
  ggplot(aes(x = long, y=lat, group=group, fill=region)) + 
  geom_polygon() +
  theme(legend.position = "none")

###############
# install.packages("Lahman")

library(Lahman)
?`Lahman-package`

data("HallOfFame")
View(HallOfFame)

# Identify the four players who were inducted in the Hall of 
# Fame in 2018 by the BBWAA (Baseball writers' association of America), by filtering the Master data for their player IDs.

# Daredevils only: can you get the function left_join to work (read up on the help), so that all of the names are included in the 2018 Hall of Fame candidates?

left_join(x = HallOfFame,
  y = People %>% select(nameFirst, nameLast, playerID),
  by="playerID"
  )
