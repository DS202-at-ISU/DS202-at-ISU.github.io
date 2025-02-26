library(classdata)
library(dplyr)

# Get a subset of all crimes in Iowa, 
# Plot incidences/rates for one type of 
# crime over time.

iowa_robbery <- filter(fbi, 
                       type == 'robbery',
                       state == 'Iowa')
ggplot(iowa_robbery,
       aes(x = year, y = count)) +
  geom_line()

# Get a subset of all crimes in 2020. Plot the number or 
# rate for one type of crime by state.
robbery_2020 <- 
  filter(fbi,
         year == '2020',
         type == 'robbery')
ggplot(robbery_2020,
       aes(x = state, y = count)) +
  geom_col()
ggplot(robbery_2020,
       aes(x = state, weight = count)) +
  geom_bar() +
  coord_flip()

data <- filter(
  fbi, 
  year >= 2016,
  type == 'homicide'
)
data$rate <- data$count / data$population
quan90 <- quantile(data$rate, 0.90)
data$greater_than_90 <- data$rate >= quan90
data_filtered <- filter(data, greater_than_90)
ggplot(data_filtered,
       aes(x = state,
           y = rate)) +
  geom_col() +
  coord_flip()



x <- c(TRUE, TRUE, FALSE, TRUE, FALSE)
which(x)
df <- data.frame(
  x = x,
  type = c("apple", "apple", "cherry",
           "apple", "banana")
)
df[which(df$x), ]
df[which(df$type == 'apple'), ]
df[df$type == 'apple', ]

which.max(fbi$population)
View(fbi[which.max(fbi$population), ])
fbi[which.min(fbi$population), ]

CA_burglary <- filter(fbi, 
                      state == 'California',
                      type == 'burglary')
sum(CA_burglary$count)

violent_crime_1980 <- filter(
  fbi, 
  violent_crime == TRUE,
  year == 1980
)
violent_crime_1980$rate <- violent_crime_1980$count / violent_crime_1980$population
result <- violent_crime_1980[which.max(violent_crime_1980$rate), ]
View(result)

violent_crime_2020 <- filter(
  fbi, 
  violent_crime == TRUE,
  year == 2020
)
violent_crime_2020$rate <- violent_crime_2020$count / violent_crime_2020$population
result <- violent_crime_2020[which.max(violent_crime_2020$rate), ]
View(result)

data <- filter(
  fbiwide,
  motor_vehicle_theft > robbery,
  year == 2011
)
unique(data$state)

x <- c('a', 'a', 'b', 'c', 'a', 'd', 'c')
unique(x)

library(tidyverse)
library(classdata)

filter(fbi, year == 2018, state == "Iowa")
fbi[(fbi$year == 2018) & (fbi$state == "Iowa"), ]

1:6 %>% sum()

fbi_modified <- fbi %>% 
  mutate(
    rate = count/population*90000,
    rate2 = count/population*10000,
    rate3 = rate + rate2
  )
View(fbi_modified)

fbi %>% select(
  state, year, count
)

fbi %>% select(
  year, state, count
)

fbi %>% select(
  c(1, 2, 3)
)

fbi %>% select(
  starts_with("state")
)

fbi %>% select(
  c("state", "count")
)

fbi %>% select(
  -state_id
)


fbiwide %>% select(7:16)
fbiwide %>% select(homicide:arson)
fbiwide %>% select(-(1:6))

all_crimes <- colnames(fbiwide)[7:16]
fbiwide %>% select(all_crimes)

fbiwide[, all_crimes]

fbiwide %>% summarise(
  mean_population = mean(population),
  avg_homicide = mean(homicide, na.rm = TRUE),
  med_robbery = median(robbery, na.rm = TRUE),
  max_MVT = max(motor_vehicle_theft)
)

fbi %>% 
  summarise(mean_rate = mean(count/population*90000, na.rm=TRUE), 
            sd_rate = sd(count/population*90000, na.rm = TRUE))
fbi %>% 
  mutate(
    rate = count / population * 90000
  ) %>% 
  summarise(
    mean_rate = mean(rate, na.rm = T),
    sd_rate = sd(rate, na.rm = TRUE)
  )
c(T, T, F, F, T)

df <- data.frame(
  type1 = c('a', 'a', 'b', 'b', 'c', 'c'),
  type2 = c('class1', 'class1', 'class1', 'class2', 'class2', 'class2'),
  value = c(1, 2, 3, 4, 5, 6)
)

df %>% 
  group_by(type1, type2) %>% 
  summarise(
    sum = sum(value),
    mean = mean(value),
    max = max(value)
  )













