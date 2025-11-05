library(tidyverse)

data(nasa, package="GGally")
View(nasa)

nasa |> 
  filter(id == '1-1') |> 
  ggplot(aes(x = date, y = temperature)) +
  geom_point()

ggplot() +
  geom_point(
    data = nasa |> filter(id == '1-1'),
    aes(x = date, y = temperature)
  ) +
  geom_line(
    data = nasa |> filter(id == '1-1'),
    aes(x = date, y = temperature)
  )

ggplot(
  data = nasa |> filter(id == '1-1'),
  aes(x = date, y = temperature)
) +
  geom_point() +
  geom_line(color = 'red')

ggplot(
  data = nasa |> filter(id == '1-1'),
  aes(x = date, y = temperature)
) +
  geom_line(color = 'red')+
  geom_point() +
  geom_smooth(model='lm', 
              se = TRUE)

nasa |> filter(id == '1-1') |> 
  ggplot(
  aes(x = date, y = temperature)
) +
  geom_point() +
  geom_line(color = 'red')+
  geom_smooth(method='lm', se = TRUE)

nasa %>% filter(id=="1-1") %>%
  ggplot(aes(x = date, y= temperature)) + 
  geom_point() +
  geom_line() +
  geom_smooth(method="lm", se=FALSE)

nasa %>% filter(id=="1-1") %>%
  ggplot(aes(x = date, y= temperature)) + 
  geom_point() +
  geom_line() +
  geom_smooth(method="lm", se=FALSE) +
  geom_text(aes(label = time,
                x = date + weeks(4),
                y = temperature + 0.1),
            data = nasa |> filter(id == '1-1',
                                  temperature > 298))

target_time <- c(16, 28, 35)  
nasa %>% filter(id=="1-1") %>%
  ggplot(aes(x = date, y= temperature)) + 
  geom_point() +
  geom_line() +
  geom_smooth(method="lm", se=FALSE) +
  geom_text(aes(label = time,
                x = date + weeks(4),
                y = temperature + 0.1),
            data = nasa |> filter(id == '1-1',
                                  time %in% target_time))

library(Lahman)
View(LahmanData)

View(People)
View(HallOfFame)

HOFer_18 <- HallOfFame |> 
  filter(yearID == 2018, 
         inducted == "Y",
         votedBy == 'BBWAA') |> 
  pull(playerID)
People |> 
  filter(playerID %in% HOFer_18) |> 
  select(playerID, nameFirst, nameLast)

df1 <- data.frame(id = 1:6, trt = rep(c("A", "B", "C"), rep=c(2,1,3)), value = c(5,3,7,1,2,3))
df1
df2 <- data.frame(id=c(4,4,5,5,7,7), stress=rep(c(0,1), 3), bpm = c(65, 125, 74, 136, 48, 110))
df2

df1 |> left_join(df2, by = 'id')
df2 |> left_join(df1, by = 'id')
df1 |> right_join(df2, by = 'id')
df2 |> right_join(df1, by = 'id')

dim(HallOfFame)
dim(People)

HOF_result <- HallOfFame |> 
  left_join(
    People |> 
      select(playerID, deathYear,
             nameFirst, nameLast),
    by = "playerID"
  )
HOF_result |> 
  filter(inducted == "Y",
         deathYear > 2018 | is.na(deathYear)) |> 
  select(playerID, nameFirst, nameLast,
         inducted, yearID, 
         deathYear)
HOF_result |> 
  filter(nameFirst == 'Sammy',
         nameLast == 'Sosa') |> 
  select(nameFirst, nameLast,
         yearID, inducted)





