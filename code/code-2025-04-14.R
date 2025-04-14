library(Lahman)
View(People)

target_ID <- HallOfFame %>% 
  filter(yearID == 2018,
         inducted == "Y",
         votedBy == "BBWAA") %>% 
  pull(playerID)

People %>% 
  filter(playerID %in% target_ID)


df1 <- data.frame(id = 1:6, trt = rep(c("A", "B", "C"), rep=c(2,1,3)), value = c(5,3,7,1,2,3))
df1

df2 <- data.frame(id=c(4,4,5,5,7,7), stress=rep(c(0,1), 3), bpm = c(65, 125, 74, 136, 48, 110))
df2

left_join(df1, df2, by = 'id')

left_join(df2, df1, by = 'id')
right_join(df1, df2, by = 'id')

result <- People %>% 
  select(playerID, nameFirst, nameLast, 
         deathYear) %>% 
  filter(deathYear > 2018 | 
           is.na(deathYear)) %>% 
  inner_join(HallOfFame, by = 'playerID')

result %>% 
  select(playerID, nameFirst, nameLast,
         deathYear) %>% 
  unique()

result %>% 
  filter(nameFirst == "Sammy")

tt <- c('name1' = 'a', 'name2' = 'b')

inner_join(df1, df2, by = 'id')
anti_join(df1, df2, by = 'id')


states <- map_data("state")

states %>% 
  ggplot(aes(x = long, y = lat)) +
  geom_point()

states %>% 
  ggplot(aes(x = long, y = lat)) +
  geom_path(aes(group = group))

# geom_path = geom_line + order info

states %>% 
  ggplot(aes(x = long, y = lat)) +
  geom_polygon(aes(group = group))


counties <- map_data("county")
counties %>% 
  ggplot(aes(x = long, y = lat, 
             group = group)) +
  geom_path() +
  geom_polygon(
    data = counties %>% 
      filter(subregion == 'story'),
    fill = 'red'
  )

counties %>% group_by(group) %>% 
  summarise(
    county_name = subregion[1]
  ) %>% 
  count(county_name) %>% 
  arrange(desc(n))




