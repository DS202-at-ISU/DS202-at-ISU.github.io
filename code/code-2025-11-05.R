x <- c("Var_name" = 1, 2)
x

df1 <- data.frame(id = 1:6, trt = rep(c("A", "B", "C"), rep=c(2,1,3)), value = c(5,3,7,1,2,3))
df1

df2 <- data.frame(id=c(4,4,5,5,7,7), stress=rep(c(0,1), 3), bpm = c(65, 125, 74, 136, 48, 110))
df2

library(tidyverse)
df1 |> left_join(df2)
df1 |> anti_join(df2, by = 'id')

states <- map_data("state")
View(states)

counties <- map_data("county")
View(counties)

states |> 
  ggplot(aes(x = long, y = lat)) +
  geom_polygon(aes(group = group,
                   fill = lat))

counties |> 
  ggplot(aes(x = long, y = lat,
             group = group)) +
  geom_polygon() +
  geom_polygon(
    data = counties |> 
      filter(subregion == 'washington'),
    fill = 'red'
  )

counties |> 
  select(region, subregion) |> 
  unique() |> 
  count(subregion) |> 
  arrange(desc(n)) |> 
  head()

counties |> 
  filter(subregion == 'washington') |> 
  pull(region) |> 
  unique() 

data(fbi, package="classdata")
fbi14 <- fbi %>% filter(year == 2014)
# View(fbi14)
# View(states)
fbi14$region <- tolower(fbi14$state)
fbi14 |> 
  anti_join(states, by = 'region') |> 
  pull(region) |> 
  unique()

states |> 
  anti_join(fbi14, by = 'region') 

fbi14.map <- fbi14 |> 
  left_join(states, by = 'region')
View(fbi14)

fbi14.map |> 
  filter(type == 'motor_vehicle_theft') |> 
  ggplot(aes(x = long, y = lat)) +
  geom_polygon(aes(group = region,
                   fill = count / population))

fbi20_car_theft <- 
  fbi |> 
  filter(year == 2020,
         type == 'motor_vehicle_theft') |> 
  mutate(
    region = tolower(state),
    rate = count / population * 1000
  )

fbi20_car_theft_map <- 
  fbi20_car_theft |> 
  left_join(states, by = 'region')

states_center <- states |> 
  group_by(region) |> 
  summarise(
    long = median((long)),
    lat = median((lat))
  )
states_center <- states_center |> 
  left_join(fbi20_car_theft |> select(region, rate), by = 'region')
# View(states_center)
fbi20_car_theft_map |> 
  ggplot(aes(x = long, y = lat)) +
  geom_polygon(aes(group = region,
                   fill = rate)) +
  scale_fill_gradient2(
    midpoint = median(fbi20_car_theft$rate)) +
  geom_text(
    data = states_center,
    aes(x = long, y = lat, label = round(rate, 2)),
    size = 5
  ) +
  ggthemes::theme_map()

df <- data.frame(x = rep('a', 6))

df |> ggplot(aes(x = x)) +
  geom_bar()


