library(tidyverse)

"10-17-2023" - "10-07-2023"
mdy("10-17-2023")
mdy("10-17-2023") - mdy("10-07-2023")

class(mdy("10-17-2023"))
class("10-17-2023")

"2023/10/31" %>% ymd()
"10/31/2023" %>% mdy()
"10-31-2023" %>% mdy()
"10 31 2023" %>% mdy()

"10/31/2023 8:00:00" %>% mdy_hms()
"10/31/2023 8:00:00" %>% dmy_hms()
"10/09/2023" %>% mdy()
"10/09/2023" %>% dmy()
####

# url <- "https://github.com/ds202-at-ISU/materials/blob/master/03_tidyverse/data/ames-liquor.rds?raw=TRUE"
# download.file(url, "data/ames-liquor.rds", mode="wb")
ames <- readRDS("data/ames-liquor.rds")

summary(ames$Date)

ames$Date <- lubridate::mdy(ames$Date)

summary(ames$Date)

#######################
example_time_var <- now()
year(example_time_var)
month(example_time_var)
day(example_time_var)

wday(example_time_var, label = TRUE)
wday(mdy("10/26/2023"), label = TRUE)

example_time_var - years(1)
example_time_var + years(1)


###########
str(ames)

ames %>% 
  ggplot(aes(x = year(Date))) +
  geom_bar()

# ames %>% 
#   ggplot(aes(x = Date)) +
#   geom_bar()

# this is equivalent to the above
ames %>% 
  mutate(
    year = year(Date)
  ) %>% 
  ggplot(aes(x = year)) + 
  geom_bar()

ames %>% 
  mutate(
    year = year(Date)
  ) %>% 
  filter(year == 2014) %>% 
  ggplot(aes(x = year)) + 
  geom_bar()

ames %>% 
  ggplot(aes(x = year(Date), 
              weight = `Volume Sold (Gallons)`)) +
  geom_bar()

ames %>% 
  mutate(
    weekdays = wday(Date, label = TRUE)
  ) %>% 
  group_by(weekdays) %>% 
  tally()

ames %>% 
  ggplot(aes(x = wday(Date, label=TRUE))) + 
  geom_bar()

ames %>% 
  ggplot(aes(x = wday(Date, label=TRUE),
             weight = `Volume Sold (Gallons)`)) + 
  geom_bar()


ames %>% 
  ggplot(aes(x = month(Date, abbr = TRUE, label=TRUE), 
             weight = `Volume Sold (Gallons)`/1000)) + 
  geom_bar() + 
  facet_wrap(~year(Date), ncol = 6) +
  ylab("Volume of alcohol sold (in thousands of  Gallons)")

result_all_positive <- ames %>% 
  group_by(Date) %>% 
  summarise(
    daily_sales = sum(`Sale (Dollars)`, na.rm = TRUE)
  )
result_all_positive
mean(result_all_positive$daily_sales)

result <- ames %>% 
  complete(Date = seq(from=ymd("2012-01-01"), 
                      to =ymd("2022-09-30"), by="day")) %>% 
  group_by(Date) %>% 
  summarise(
    daily_sales = sum(`Sale (Dollars)`, na.rm = TRUE)
  )
result
mean(result$daily_sales)

  
  