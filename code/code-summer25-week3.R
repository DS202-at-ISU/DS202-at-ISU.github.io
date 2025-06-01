x <- c(TRUE, FALSE, TRUE, FALSE)
y <- c(T, F, T, F)
identical(x, y)

num <- c(1, 3, 5, 2, 4, 6)
num > 3
num <= 3
num == 1
num != 1

index <- num %in% c(1, 2, 3)
num[index]
num[ num %in% c(1, 2, 3) ]

df <- data.frame(
  name = c('apple', 'apple', 'banana', 'banana'),
  value = c(1, 3, 2, 4)
)
subset(df, 
       df$name == 'apple')
subset(df, 
       df$value %in% c(1, 3))

(num == 1) | (num == 3)
(num > 2) & (num < 5)

a <- c(1, 15, 3, 20, 5, 8, 9, 10, 1, 3)
a < 20
(a^2 >= 100) | (a^2 < 10)

(a == 1) | (a == 3)
a %in% c(1, 3)

5 %% 2 
a %% 2 == 0

library(classdata)
library(dplyr)

filter(fbi, year == 2014)
tt <- filter(fbi, 
             type == "larceny", 
             state %in% c("Iowa", "Minnesota"))
View(tt)

library(classdata)
filter(fbi, year == 2014)
dplyr::filter(fbi, year == 2014)

library(dplyr)
filter()

library(ggplot2)

iowa_crime <- filter(fbi,
                     state == 'Iowa',
                     type == 'larceny')
ggplot(iowa_crime,
       aes(x = year, y = count)) +
  geom_line()

crime_2020 <- filter(fbi,
                     year == 2020,
                     type == 'larceny')
ggplot(crime_2020, 
       aes(x = state, y = count)) +
  geom_col()
ggplot(crime_2020, 
       aes(x = state_abbr, weight = count)) +
  geom_bar() +
  coord_flip()

homicide_crime <- filter(fbi,
                         year > 2015,
                         type == 'homicide')
homicide_crime$rate <- 
  homicide_crime$count / 
  homicide_crime$population * 10000
View(homicide_crime)

?quantile
threshold <- quantile(homicide_crime$rate, 0.9)
final_df <- filter(homicide_crime,
                   rate > threshold)
ggplot(final_df, 
       aes( x = state_abbr, y = rate)) +
  geom_col()

ggplot(filter(homicide_crime,
              rate > threshold), 
       aes( x = state_abbr, y = rate)) +
  geom_col()

num <- c(1, 3, 5, 2, 4, 6)
which(num > 3)
num > 3

fbi[which(fbi$population > 10000000), ]
fbi[fbi$population > 10000000, ]
which.max(num)
which.min(num)

which.max(fbi$population)
fbi[1864, c('state', 'population')]

tt <- filter(fbi,
             state == 'California',
             type == 'burglary')
tt$count
ggplot(tt, aes(x = year, y = count)) +
  geom_line()

fbi1980_violent <- filter(fbi, 
                          year == 1980,
                          violent_crime == TRUE)
fbi1980_violent$rate <- 
  fbi1980_violent$count /
  fbi1980_violent$population

which.max(fbi1980_violent$rate)
View(fbi1980_violent[254,])

fbiwide_2011 <- filter(fbiwide, year == 2011)
logical_vec <- fbiwide_2011$motor_vehicle_theft > 
  fbiwide_2011$robbery
fbiwide_2011$state[logical_vec]
length(fbiwide_2011$state[logical_vec])


library(classdata)
library(tidyverse)

# if you need RTools for your Windows machine
# please check my another video

# filter(fbi, 
#        year == 2014)
# subset(fbi,
#        fbi$year == 2014)
# subset(fbi, 
#        year == 2014)

head(filter(fbi, year == 2014), 10)
filter(fbi, year == 2014) |> head(10)
fbi |> 
  filter(year == 2014) |>
  head(10)

head(fbi, 10)
fbi |> head(10)

# shortcut for |>
# mac: command + shift + m
# if what inserts is %>%, not |>, then go to global options
?magrittr::`%>%`
?`|>`

# mutate
fbi$rate <- fbi$count / fbi$population
fbi$rate2 <- fbi$count / fbi$population * 10
fbi$rate3 <- fbi$count / fbi$population * 100

fbi |> 
  mutate(
    rate = count / population,
    rate2 = count / population * 10,
    rate3 = count / population * 100,
    log_population = log(population),
    population = population + 10,
    rate4 = rate + rate2 - rate3
  )
colnames(fbi)
fbi <- fbi |> 
  mutate(
    rate = count / population,
    rate2 = count / population * 10,
    rate3 = count / population * 100,
    log_population = log(population),
    population = population + 10,
    rate4 = rate + rate2 - rate3
  )
colnames(fbi)

fbi |> 
  arrange(desc(year), 
          type, 
          desc(count)) |> 
  View()

# top 10 states in 2020 for the number of 
# homicide reports
fbi |> 
  filter(type == 'homicide',
         year == 2020) |> 
  arrange(desc(count)) |> 
  head(10)

fbi |> 
  select(state, count, population, type)
fbi |> 
  select(c(1, 2, 5))
fbi |> 
  select(starts_with("state"))
fbi |> 
  select(-state_id, -state_abbr)

fbiwide |> 
  select(homicide:arson)

fbi |> 
  summarise(
    mean_pop = mean(population),
    median_pop = median(population),
    max_count = max(count, na.rm = TRUE)
  )

fbi |> 
  mutate(
    rate = count / population * 90000
  ) |> 
  summarise(
    rate_mean = mean(rate, na.rm = TRUE),
    rate_sd = sd(rate, na.rm = TRUE)
  )

df <- data.frame(
  name = c('apple', 'apple', 'banana', 'banana'),
  value = c(1, 3, 2, 4)
)
df |> 
  group_by(name) |> 
  mutate(
    value2 = min(value) + 1
  )
df |> 
  mutate(
    value2 = min(value) + 1
  )

df2 <- data.frame(
  gender = c('F', 'M', "F", "M"),
  height = c(5, 6, 5, 4)
)
df2 |> 
  group_by(gender) |> 
  summarise(
    avg_height = mean(height)
  )

mtcars |> 
  group_by(cyl, am) |> 
  summarise(
    avg_hp = mean(hp),
    avg_mpg = mean(mpg)
  )












