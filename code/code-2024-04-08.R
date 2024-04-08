library(tidyverse)
library(Lahman)

LahmanData

View(HallOfFame)
View(People)

HoF18_inducted_ID <- HallOfFame %>% 
  filter(yearID == 2018,
         votedBy == "BBWAA",
         inducted == "Y") %>% 
  pull(playerID)

People %>% filter(
  playerID %in% HoF18_inducted_ID
)

df1 <- data.frame(id = 1:6, trt = rep(c("A", "B", "C"), rep=c(2,1,3)), value = c(5,3,7,1,2,3))
df1

df2 <- data.frame(id=c(4,4,5,5,7,7), stress=rep(c(0,1), 3), bpm = c(65, 125, 74, 136, 48, 110))
df2

left_join(df1, df2)
right_join(df2, df1)

inner_join(df1, df2, by = "id")

# left_join(HallOfFame, People)
HallOfFame %>% 
  left_join(People %>% select(
    playerID, nameFirst, nameLast, nameGiven,
    deathYear
  )) %>% 
  filter((deathYear > 2018 | is.na(deathYear))) %>% 
  select(playerID, nameGiven) %>% 
  unique()

HallOfFame %>% 
  left_join(People %>% select(
    playerID, nameFirst, nameLast, nameGiven,
    deathYear
  )) %>% 
  filter(nameFirst == "Sammy")

states <- map_data("state")

states %>% 
  ggplot(aes(x = long, y = lat)) + 
  geom_point()

states %>% 
  ggplot(aes(x = long, y = lat)) + 
  geom_path(aes(group = group))

states %>% 
  ggplot(aes(x = long, y = lat)) + 
  geom_polygon(aes(group = group))

counties <- map_data("county")

counties %>% mutate(
  called_story = subregion == "story"
) %>% 
  ggplot(aes(x = long, y = lat, group = group,
             fill = called_story)) +
  geom_polygon()

























