library(tidyverse)
library(lubridate)

now()
class(mdy("04-07-2025"))
class("04-07-2025")

ymd("2025-04-07")
dmy("07-04-2025")
my("04-2025")

ames <- readRDS("data/ames-liquor.rds")
summary(ames$Date)

ames$Date <- mdy(ames$Date)
summary(ames$Date)

month(now())
mday(now())
wday(now(), label = TRUE)
wday(now())
week(now())
hour(now())
minute(now())

end_date <- now()
end_date - years(1)
end_date - days(10)
now() + days(10)

ames %>% 
  mutate(
    year = year(Date)
  ) %>% 
  group_by(year) %>% 
  tally() %>% 
  ggplot(aes(x = year, y = n)) +
  geom_col()

ames %>% 
  mutate(
    year = year(Date)
  ) %>% 
  group_by(year) %>% 
  summarise(
    total_volumn = sum(`Volume Sold (Gallons)`)
  ) %>% 
  ggplot(aes(x = year, y = total_volumn)) +
  geom_col()

ames %>% 
  mutate(
    weekday = wday(Date, label = TRUE)
  ) %>% 
  group_by(weekday) %>% 
  tally() %>% 
  ggplot(aes(x = weekday, y = n)) +
  geom_col()

ames %>% 
  mutate(
    weekday = wday(Date, label = TRUE)
  ) %>% 
  group_by(weekday) %>% 
  summarise(
    total_volumn = sum(`Volume Sold (Gallons)`)
  ) %>% 
  ggplot(aes(x = weekday, y = total_volumn)) +
  geom_col()

ames %>% 
  mutate(
    year = year(Date),
    weekday = wday(Date, label = TRUE)
  ) %>% 
  group_by(year, weekday) %>% 
  summarise(
    total_volumn = sum(`Volume Sold (Gallons)`)
  ) %>% 
  ggplot(aes(x = weekday, y = total_volumn)) +
  geom_col() +
  facet_wrap(~ year)

ames %>% 
  group_by(Date) %>% 
  tally() %>% 
  pull(n) %>% 
  mean()

ames %>% 
  group_by(Date) %>% 
  tally() %>% 
  complete(
    Date = seq(mdy("01-01-2012"), 
               max(ames$Date), "day"),
    fill = list(n = 0)
  ) %>% 
  pull(n) %>% 
  mean()




