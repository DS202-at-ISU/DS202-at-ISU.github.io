library(classdata)
library(tidyverse)

"11/04/2024" + "3 days" 
x <- as.Date("2024/11/04")
typeof(x)
class(x)

ymd("2024/11/04")
mdy("11/04/2024")
ymd("2024-11-04")
class(ymd("2024:11:04"))

ymd_hms("2024/11/04 12:16:34")

ames <- readRDS("data/ames-liquor.rds")
summary(ames$Date)
ames$Date <- mdy(ames$Date)
summary(ames$Date)

x <- ymd("2024-11-04")
x
year(x)
month(x)
week(x)
wday(x, label = TRUE, abbr = FALSE)
mday(x)
yday(x)

year("2024-11-04")
yday("2024-11-04")

end_date <- now()
end_date - days(10)
end_date - years(1)
end_date - months(2)

View(ames)

num_sales_year <- ames %>% mutate(
  year = year(Date)
) %>% 
  count(year)
num_sales_year %>% 
  ggplot(aes(x = factor(year), y = n)) +
  # geom_line()
  geom_col()

ames %>% 
  mutate(
    year = year(Date)
  ) %>% 
  ggplot(aes(x = factor(year))) +
  geom_bar()

ames %>% 
  mutate(
    year = year(Date)
  ) %>% 
  ggplot(aes(x = factor(year),
             weight = `Volume Sold (Gallons)`)) +
  geom_bar()

ames %>% 
  mutate(
    weekday = wday(Date, label = TRUE),
    year = year(Date)
  ) %>% 
  ggplot(aes(x = weekday)) +
  geom_bar() +
  facet_wrap(~year)

ames %>% 
  mutate(
    weekday = wday(Date, label = TRUE),
    year = year(Date)
  ) %>% 
  ggplot(aes(x = weekday,
             weight = `Volume Sold (Gallons)`)) +
  geom_bar() +
  facet_wrap(~year)

date_results <- ames %>% 
  group_by(Date) %>% 
  summarise(
    num_sales = n(),
    vol_sold = sum(`Volume Sold (Gallons)`)
  )
mean(date_results$num_sales)

date_results %>% 
  complete(
    Date = seq.Date(min(Date), max(Date), by="day"),
    fill = list(num_sales = 0,
                vol_sold = 0)
  ) %>% 
  pull(num_sales) %>% 
  mean()
    
    
    
    
    
    