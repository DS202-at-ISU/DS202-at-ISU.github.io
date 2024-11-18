library(Lahman)
library(tidyverse)

HOF_player_2018 <- HallOfFame %>% 
  filter(yearID == 2018,
         inducted == 'Y',
         votedBy == "BBWAA") %>% 
  pull(playerID)

People %>% 
  filter(playerID %in% HOF_player_2018)

df1 <- data.frame(id = 1:6, trt = rep(c("A", "B", "C"), rep=c(2,1,3)), value = c(5,3,7,1,2,3))
df1

df2 <- data.frame(id=c(4,4,5,5,7,7), stress=rep(c(0,1), 3), bpm = c(65, 125, 74, 136, 48, 110))
df2

left_join(df1, df2, by="id")
right_join(df1, df2, by = 'id')
right_join(df2, df1, by = 'id')

View(People)
View(HallOfFame)
People_info <- People %>% 
  select(playerID, nameFirst, nameGiven,
         nameLast, deathYear)
HallOfFame_info <- HallOfFame %>% 
  select(playerID, inducted)
result <- left_join(HallOfFame_info,
                    People_info,
                    by = 'playerID')
View(result)

result %>% 
  filter(inducted == "Y", 
         (deathYear >= 2018 | 
            is.na(deathYear)))

HallOfFame %>% 
  select(
    playerID, inducted
  ) %>% 
  left_join(
    People %>% 
      select(playerID, deathYear, 
             nameFirst, nameLast),
    by = 'playerID'
  ) %>% 
  filter(
    inducted == 'Y',
    (deathYear >= 2018 | is.na(deathYear))
  )

anti_join(df1, df2, by="id")
left_join(df1, df2, by = 'id')

anti_join(df2, df1, by = 'id')




states <- map_data("state")
counties <- map_data("county")

counties %>% 
  ggplot(aes(x = long, y = lat,
             group = group)) +
  geom_polygon() +
  geom_polygon(
    data = counties %>% 
      filter(subregion == "story"),
    aes(fill = subregion)
  )

counties %>% 
  select(group, subregion) %>% 
  unique() %>% 
  count(subregion) %>% 
  arrange(desc(n)) %>% 
  head(10)








