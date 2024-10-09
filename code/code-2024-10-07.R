library(tidyverse)
library(classdata)

fbi2 <- fbi %>% 
  mutate(
    log_population = log(population),
    rate = count / population,
    population2 = population + 100
  )


fbi %>% 
  select(
    starts_with("state")
  )

fbiwide %>% 
  select(7:16)
fbiwide %>% 
  select(homicide:arson)
fbiwide %>% 
  select(
    homicide, rape_legacy, rape_revised
  )
fbiwide %>% 
  select(
    colnames(fbiwide)[7:16]
  )
fbiwide %>% 
  select(
    c("homicide", "rape_legacy", "", ...)
  )

fbiwide %>% 
  summarise(
    homicide_mean = mean(homicide, na.rm = TRUE),
    arson_mean = mean(arson, na.rm = TRUE)
  )

fbi %>% 
  mutate(
    rate = count / population * 90000
  ) %>% 
  summarise(
    rate_mean = mean(rate, na.rm = TRUE),
    rate_sd = sd(rate, na.rm = TRUE)
  )

fbi %>% 
  mutate(
    rate = count / population * 90000
  ) %>% 
  group_by(type) %>% 
  summarise(
    rate_mean = mean(rate, na.rm = TRUE),
    rate_sd = sd(rate, na.rm = TRUE),
    rate_min = min(rate, na.rm = TRUE),
    rate_max = max(rate, na.rm = TRUE)
  )

tt <- c('a', 'b', 'c', 'a', 'c', 'b')
factor(tt, levels = c('b', 'c', 'a'))

summary(fbi$year)

fbi$year <- factor(fbi$year)
summary(fbi$year)
table(fbi$year)

summary(fbi$type)
table(fbi$type)
fbi$type <- factor(fbi$type)
summary(fbi$type)

twoyear <- dplyr::filter(classdata::fbi, year %in% c(1980, 2016))

ggplot(data = twoyear, 
       aes(x = year, 
           y = count)) + 
  geom_boxplot()

ggplot(data = twoyear, 
       aes(x = factor(year), 
           y = count)) + 
  geom_boxplot() 

mode(fbi$year)  
mode(factor(fbi$year))
is.character(fbi$type)
mode(fbi$type)

as.character(c(1,2,3))
as.matrix
as.data.frame

tt <- c('a', 'b', 'c', 'a', 'c', 'b')
tt_fac <- factor(tt, levels = c('a', 'b', 'c'))
as.numeric(tt_fac)

tt <- c('a', 'b', 'c', 'a', 'c', 'b')
tt_fac <- factor(tt, levels = c('b', 'a', 'c'))
as.numeric(tt_fac)

year_fct <- factor(fbi$year)
as.numeric(year_fct)
as.numeric(as.character(year_fct))

levels(tt_fac)

fbi %>% 
  ggplot(aes(x = type, y = log10(count))) + 
  geom_boxplot()

fbi$type <- factor(
  fbi$type, 
  levels=c("larceny", "burglary", 
           "motor_vehicle_theft", "arson", 
           "aggravated_assault", "robbery", 
           "rape_legacy", "rape_revised", 
           "homicide"))
fbi %>% ggplot(aes(x = type, y = log10(count))) + geom_boxplot()

fbi$type <- 
  reorder(fbi$type,
          fbi$count,
          na.rm = TRUE)
fbi %>% ggplot(aes(x = type, y = log10(count))) + geom_boxplot() +coord_flip()

fbiwide %>% 
  ggplot(
    aes(
      x = factor(year),
      y = motor_vehicle_theft
    )
  ) +
  geom_boxplot()

fbiwide %>% 
  mutate(
    rate = motor_vehicle_theft/population*100000
  ) %>% 
  ggplot(
    aes(
      x = state_abbr,
      y = rate
    )
  ) +
  geom_boxplot() +
  coord_flip()

fbiwide %>% 
  mutate(
    rate = motor_vehicle_theft/population*100000
  ) %>% 
  ggplot(
    aes(
      x = reorder(state_abbr, rate, 
                  sd, na.rm = TRUE),
      y = rate
    )
  ) +
  geom_boxplot() +
  coord_flip()






