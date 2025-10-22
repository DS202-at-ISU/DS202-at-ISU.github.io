library(lubridate)
library(tidyverse)

now()
class(mdy("10-17-2022"))
class("10-17-2022")

mdy("10-20-2025")
ymd("2025/10/20")
dmy("20:10:2025")

month(now())
wday(now())
mday(now())
yday(now())
hour(now())
wday(now(), label = TRUE)
now() - months(1)
now() + months(1)

ames <- readRDS("data/ames-liquor.rds")
ames$Date <- mdy(ames$Date)
ames |> 
  mutate(
    year = factor(year(Date))
  ) |> 
  ggplot(aes(x = year)) +
  geom_bar()

ames |> 
  mutate(
    year = factor(year(Date)),
    month = factor(month(Date))
  ) |> 
  ggplot(aes(x = month)) +
  geom_bar(aes(weight = `Volume Sold (Gallons)`)) +
  facet_wrap(~year, scales = "free_x")

ames |> 
  mutate(
    weekday = wday(Date, label = TRUE),
    year = factor(year(Date))
  ) |> 
  ggplot(aes(x = weekday)) +
  geom_bar() +
  facet_wrap(~year)
   
ames |> 
  mutate(
    weekday = wday(Date, label = TRUE),
    year = factor(year(Date))
  ) |> 
  ggplot(aes(x = weekday)) +
  geom_bar(aes(weight = `Volume Sold (Gallons)`)) +
  facet_wrap(~year)

number_sales_count <- ames |> 
  group_by(Date) |> 
  summarise(
    n = n()
  )
View(number_sales_count)
mean(number_sales_count$n)

seq.Date(
  mdy("10-10-2025"),
  mdy("10-20-2025"),
  by = 1
)

number_sales_count |> 
  complete(
    Date = seq.Date(min(Date), 
                    max(Date), 
                    1),
    fill = list(n = 0)
  ) |> 
  pull(n) |> 
  mean()


  
  
  

