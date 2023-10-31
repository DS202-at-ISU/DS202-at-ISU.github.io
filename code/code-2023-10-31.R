# url <- "https://github.com/ds202-at-ISU/materials/blob/master/03_tidyverse/data/ames-liquor.rds?raw=TRUE"
# download.file(url, "data/ames-liquor.rds", mode="wb")
ames <- readRDS("data/ames-liquor.rds")
ames$Date <- lubridate::mdy(ames$Date)

ames %>% ggplot(aes(x = year(Date))) + geom_bar()
ames %>% ggplot(aes(x = year(Date), weight = `Volume Sold (Gallons)`)) + geom_bar()
ames %>% ggplot(aes(x = wday(Date, label=TRUE))) + geom_bar()
ames %>% ggplot(aes(x = wday(Date, label=TRUE), weight=`Volume Sold (Gallons)`)) + geom_bar() + 
  facet_wrap(~year(Date))


ames %>% 
  group_by(Date) %>% 
  summarise(
    total_sales = sum(`Sale (Dollars)`, na.rm = TRUE)
  ) %>% 
  pull(total_sales) %>% mean()

ames %>%
  mutate(
    Date = mdy(Date)
  ) %>%
  complete(Date = seq(from=ymd("2012-01-01"), to =ymd("2022-09-30"), by="day")) %>% #head()
  group_by(Date) %>%
  summarize(n = sum(!is.na(City))) %>% summary()


ames %>% 
  complete(Date = seq(from=ymd("2012-01-01"), 
                      to =ymd("2022-09-30"), by="day")) %>% 
  group_by(Date) %>% 
  summarise(
    total_sales = sum(`Sale (Dollars)`, na.rm = TRUE)
  ) %>% 
  pull(total_sales) %>% mean()
  
  
  
  