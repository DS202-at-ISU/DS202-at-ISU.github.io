library(classdata)
library(dplyr)
library(ggplot2)

# filter
fbi %>% 
  filter(type=="burglary", year==2016) %>% 
  head()

filter(fbi, type=="burglary", year==2016) %>% 
  head()

# mutate
fbi$rate <- fbi$count / fbi$population * 90000
fbi %>% mutate(
  rate = count / population * 90000,
  log_rate = log(rate)
) %>% select(state, year, rate, log_rate)

# arrange
fbi %>% 
  arrange(
    desc(year), 
    type, 
    desc(count)
  ) %>% head()

fbi %>% 
  arrange(
    desc(year), 
    type, 
    count
  ) %>% head()

# select
fbi %>% 
  arrange(desc(year), type, desc(count)) %>%
  select(type, count, state, year) %>% head()

fbiwide %>% select(7:16)
fbiwide %>% select(homicide:arson)
fbiwide %>% select(-(1:6))

# summarize
fbi %>% 
  summarise(
    mean_rate = mean(count/population*90000, 
                     na.rm=TRUE), 
    sd_rate = sd(count/population*90000, 
                 na.rm = TRUE))
fbi %>% 
  mutate(
    rate = count/population * 90000
  ) %>% 
  summarise(
    mean_rate = mean(rate, na.rm = TRUE),
    sd_rate = sd(rate, na.rm = TRUE)
  )


# summarize + group_by
fbi %>%
  group_by(type) %>%
  summarise(
    mean_rate = mean(count/population*90000, 
                     na.rm=TRUE), 
    sd_rate = sd(count/population*90000, 
                 na.rm = TRUE))

fbi %>% 
  group_by(type, violent_crime) %>% 
  summarise(
    mean_rate = mean(count/population*90000, 
                     na.rm=TRUE), 
    sd_rate = sd(count/population*90000, 
                 na.rm = TRUE))

# which state has the highest number of 
# homicides in year 2020?
fbi %>% 
  filter(year == 2020, type == 'homicide') %>% 
  select(state, count, type, year) %>% 
  arrange(desc(count)) 

# which state has the highest crime rate
# from 1980 to 2020
fbi %>% group_by(state, year, population) %>% 
  summarise(
    total_count = sum(count, na.rm = TRUE),
    .groups = 'drop' # drop the grouping structure
  ) %>% 
  mutate(
    crime_rate = total_count / population
  ) %>% 
  group_by(year) %>% 
  summarise(
    top_state = state[which.max(crime_rate)],
    crime_rate = crime_rate[which.max(crime_rate)]
  )

# from 1980 to 2020, which crime has the highest crime rate in US?
fbi %>% 
  group_by(type, year) %>% 
  summarise(
    total_count = sum(count, na.rm = TRUE),
    total_population = sum(population, na.rm = TRUE),
    .groups = 'drop'
  ) %>% 
  mutate(
    rate = total_count / total_population * 1000
  ) %>% 
  group_by(year) %>% 
  summarise(
    top_crime = type[which.max(rate)],
    rate_per_1000 = rate[which.max(rate)]
  )
  

# what is the average number of crimes that are 
# classified as violent (from 1980 - 2020)?
fbi %>% filter(violent_crime == TRUE) %>% 
  group_by(year) %>% 
  summarise(
    avg_count = mean(count, na.rm = TRUE)
  ) %>% 
  ggplot(aes(x = year, avg_count)) +
  geom_line()

# What is the average amount of time taken to 
# commit a given crime?

# not enough data












