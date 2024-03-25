library(tidyverse)
now()

class(mdy("03/25/2024"))

mdy("03-25-2024")
ymd("2024/03/25")
dmy("25/03/2024")

dmy_hm("25/03/2024/12/19")

# url <- "https://github.com/ds202-at-ISU/materials/blob/master/03_tidyverse/data/ames-liquor.rds?raw=TRUE"
# download.file(url, "data/ames-liquor.rds", mode="wb")
ames <- readRDS("data/ames-liquor.rds")

ames$Date
summary(ames$Date)
ames$Date <- mdy(ames$Date)
summary(ames$Date)

x <- mdy("03-25-2024")
year(x)
month(x)
day(x)
wday(x, label = TRUE)

end_date <- now()
# span is interval, years(1) is duration
span <- end_date - years(1)
span

now() - days(1)

# give a visual breakdown of the number of sales by year.
# year on the x-axis
# height of the bar as the total number of sales of that year
# group by year, summarise the total number of sales

year_sales <- ames %>% 
  mutate(
    year_of_date = year(Date)
  ) %>% 
  group_by(year_of_date) %>% 
  summarise(
    total_sales = sum(`Sale (Dollars)`, na.rm = TRUE)
  )
year_sales %>% 
  ggplot(aes(x = year_of_date, y = total_sales)) +
  geom_col()

year_sales <- ames %>% 
  mutate(
    year_of_date = year(Date),
    month_of_date = month(Date)
  ) %>% 
  group_by(year_of_date, month_of_date) %>% 
  summarise(
    total_sales = sum(`Sale (Dollars)`, na.rm = TRUE)
  )
year_sales %>% 
  ggplot(aes(x = month_of_date, y = total_sales)) +
  geom_col() + 
  facet_wrap(~year_of_date)

# recall: utilize weight aes mapping in geom_bar()
ames %>% 
  mutate(
    year_of_date = year(Date),
    month_of_date = month(Date)
  ) %>% 
  ggplot(aes(x = month_of_date, 
             weight = `Sale (Dollars)`)) +
  geom_bar() +
  facet_wrap(~year_of_date)

# ames %>% 
#   mutate(
#     year_of_date = year(Date),
#     month_of_date = month(Date)
#   ) %>% 
#   ggplot(aes(x = month_of_date, 
#              weight = `Sale (Dollars)`)) +
#   geom_bar()

ames %>% 
  mutate(
    year_of_date = year(Date),
    weekday_of_date = wday(Date, label = TRUE)
  ) %>% 
  ggplot(aes(x = weekday_of_date, 
             weight = `Sale (Dollars)`)) +
  geom_bar() +
  facet_wrap(~year_of_date)












