url <- "https://github.com/ds202-at-ISU/materials/blob/master/03_tidyverse/data/ames-liquor.rds?raw=TRUE"
download.file(url, "ames-liquor.rds", mode="wb")
ames <- readRDS("ames-liquor.rds")

library(lubridate)
# install.packages("lubridate")
now()
str(now())

ymd("2022 11 01")
str("11/1/2022")
str(mdy("11/1/2022"))

str(dmy("1.11.2022"))

str(ymd("2022-11-01"))

##################
str(ames$Date)
summary(ames$Date)
###################

mdy("12/25/2022") - today()

head(ames$Date)
ames <- ames %>% mutate(
  Date = mdy(Date)
)
summary(ames$Date)

# Don't do that!
ames %>% mutate(
  Date = as.character(Date),
  Date = dmy(Date)
)


head(year(ames$Date))
?month

head(month(ames$Date))
head(month(ames$Date, label=TRUE))
head(month(ames$Date, label=TRUE, abbr=FALSE))

?wday
head(wday(ames$Date))
head(wday(ames$Date, label=TRUE))

ames %>% 
  ggplot(
    aes(x = wday(Date, label=TRUE, week_start=7))
  ) + geom_bar()

ames_2021 <- ames %>% filter(year(Date) == 2021) 

ames_2021 %>% group_by(Date) %>%
  summarize(
    n = n()
  ) %>%
  ggplot(aes(x = Date, n)) + geom_point() +
  facet_wrap(~month(Date), scales="free_x")

##########
# give a visual breakdown of the number of sales by year. 

ames %>% 
  ggplot(aes(x = factor(year(Date)))) + geom_bar()

ames <- ames %>% mutate(
  year = year(Date),
  month = month(Date),
  weekday = wday(Date, label=TRUE)
)

# Is there a pattern recognizable? 
# Does that pattern change when considering the volume of alcohol sold?
  
ames %>% 
  ggplot(aes(x = factor(year(Date)), 
             weight = `Volume Sold (Gallons)`/1000)) + geom_bar() +
  ylab("Gallons (in thousands) sold")

#  find the weekday associated with each date in the data. 
# Introduce a variable weekday into the dataset. 
# What is the number of sales by weekday? 
ames %>% 
  ggplot(aes(x = weekday)) + geom_bar() 
  
# What is the volume of alcohol sold? 
ames %>% 
  ggplot(aes(x = weekday, weight = `Volume Sold (Gallons)`)) + geom_bar() 


# Does that pattern hold over the years?
ames %>% 
  ggplot(aes(x = weekday, weight = `Volume Sold (Gallons)`)) + 
  geom_bar() + facet_wrap(~year)

ames %>% 
  ggplot(aes(x = weekday)) + 
  geom_bar() + facet_wrap(~year)
