library(tidyverse)
# install.packages("Lahman")
library(Lahman)

HallOfFame_players <- HallOfFame %>% 
  filter(yearID == 2018,
         votedBy == 'BBWAA',
         votes > 317) %>% 
  pull(playerID)

People %>% filter(
  playerID %in% HallOfFame_players
)

df1 <- data.frame(id = 1:6, trt = rep(c("A", "B", "C"), rep=c(2,1,3)), value = c(5,3,7,1,2,3))
df1

df2 <- data.frame(id=c(4,4,5,5,7,7), stress=rep(c(0,1), 3), bpm = c(65, 125, 74, 136, 48, 110))
df2

joined_data <- left_join(HallOfFame, People,
                         by = 'playerID')
joined_data %>% 
  filter(votes > needed,
         deathYear > 2018 | is.na(deathYear))
  

