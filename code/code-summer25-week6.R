library(tidyverse)
class(now())
typeof(now())
class("2025-06-23 00:38:48 CDT")
mdy("10-17-2022")
class(ymd("2022-03-31"))
ymd("2025/06/23")

ymd("2025/06/23")
ymd("2025-06-23")
dmy("23-06-2025")

ames <- readRDS("data/ames-liquor.rds")
ames$Date <- mdy(ames$Date)
summary(ames$Date)

month(now())
year(now())
wday(now(), label = TRUE)
yday(now())

now() - months(1)

ames %>% 
  ggplot(aes(x = wday(Date, abbr = TRUE, label=TRUE), 
             weight = `Volume Sold (Gallons)`/1000)) + 
  geom_bar() + 
  facet_wrap(~year(Date), ncol = 6) +
  ylab("Volume of alcohol sold (in thousands of  Gallons)")

result <- ames |> 
  group_by(Date) |> 
  summarise(
    number_of_sales = n()
  )
mean(result$number_of_sales)

result |> 
  complete(
    Date = seq.Date(min(Date), max(Date), by = 1),
    fill = list(number_of_sales = 0)
  ) |> 
  pull(number_of_sales) |> 
  mean()

data(nasa, package="GGally")
View(nasa)


nasa %>% 
  filter(x == 1, y %in% c(1, 10)) %>%
  ggplot(aes(x = date, y = temperature,
             group = id)) + 
  geom_line()

nasa |> 
  ggplot(aes(x = date, y = temperature,
             group = id)) +
  geom_line()


nasa |> 
  filter(x == 1, y == 1) |> 
  ggplot(aes(x = date, y = ozone)) +
  geom_line()

nasa |> 
  filter(x == 1, y == 1) |> 
  ggplot(aes(x = month(date), y = ozone,
             color = factor(year(date)))) +
  geom_line()


nasa %>% filter(id=="1-1") %>%
  ggplot(aes(x = date, y= temperature)) + geom_point()

nasa %>% filter(id=="1-1") %>%
  ggplot(aes(x = date, y= temperature)) + 
  geom_point() +
  geom_line() +
  geom_smooth(method="lm", se=FALSE) +
  geom_text(aes(label = time,
                x = date + weeks(4),
                y = temperature + 0.2),
            data = nasa %>% 
              filter(id =="1-1", 
                     temperature > 298))


library(Lahman)
LahmanData

View(AwardsManagers)
View(AwardsPlayers)

HallOfFame

View(HallOfFame %>% filter(yearID==2018))
View(People)
  
players_inducted_2018 <- HallOfFame |> 
  filter(yearID == 2018,
         inducted == 'Y',
         votedBy == "BBWAA") |> 
  pull(playerID)
People |> 
  filter(playerID %in% players_inducted_2018)

df1 <- data.frame(id = 1:6, trt = rep(c("A", "B", "C"), rep=c(2,1,3)), value = c(5,3,7,1,2,3))
df1
df2 <- data.frame(id=c(4,4,5,5,7,7), stress=rep(c(0,1), 3), bpm = c(65, 125, 74, 136, 48, 110))
df2

left_join(df1, df2, by = 'id')
right_join(df2, df1, by = 'id')

HallOfFame |> 
  left_join(
    People |> 
      select(playerID, nameFirst, 
             nameLast, deathYear),
    by = 'playerID'
  ) |> 
  filter(inducted == 'Y',
         (deathYear > 2018) | is.na(deathYear))


HallOfFame |> 
  left_join(
    People |> 
      select(playerID, nameFirst, 
             nameLast),
    by = 'playerID'
  ) |> 
  filter(nameFirst == "Sammy",
         nameLast == "Sosa") |> 
  View()


library(tidyverse)
states <- map_data("state")
View(states)

counties <- map_data("county")
counties |> 
  ggplot(aes(x = long, y = lat,
             group = group)) +
  geom_polygon() +
  geom_polygon(data = counties |> 
                 filter(subregion == 'washington'),
               fill = 'red')

counties |> 
  select(group, subregion) |> 
  unique() |> 
  count(subregion) |> 
  arrange(desc(n)) |> 
  head()

data(fbi, package="classdata")
fbi14 <- fbi %>% filter(year == 2014)
head(fbi14)
fbi14$region <- tolower(fbi14$state)
fbi.map <- fbi14 %>% 
  left_join(states, by="region")
View(fbi.map)

fbi.map %>% 
  filter(type=="burglary") %>% 
  ggplot(aes(x = long, y = lat,
             fill=count/population*100000)) +
  geom_polygon(aes(group=group))

fbi_2020_map <- fbi |> 
  filter(year == 2020, 
         type == "motor_vehicle_theft" ) |> 
  mutate(
    rate = count / population * 100000,
    region = tolower(state)
  ) |> 
  left_join(states, by = 'region')

rate_midpoint <- 
  fbi_2020_map |> 
  select(region, rate) |> 
  unique() |> 
  pull(rate) |> 
  median()

fbi_2020_map |> 
  ggplot(aes(x = long, y = lat,
             group = group,
             fill = rate)) +
  geom_polygon() +
  scale_fill_gradient2(
    midpoint = rate_midpoint,
    mid = 'grey'
  ) +
  ggthemes::theme_map()





