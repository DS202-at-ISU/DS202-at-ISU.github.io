library(classdata)
library(tidyverse)

x <- c('a', 'a', 'b', 'b', 'c', 'c')
x_fac <- factor(x)

weekdays <- c("Mon", "Wed", "Tue", "Fri",
              "Thr", "Mon")
weekdays_fac <- factor(
  c("Mon", "Wed", "Tue", "Fri",
    "Thr", "Mon"),
  levels = c("Fri", "Tue", "Wed",
             "Thr", "Mon"),
  # labels = c("Friday", "Tuesday", 
  #            "Wednesday", "Thursday",
  #            "Monday")
)
weekdays_fac

library(classdata)
str(fbi)

summary(fbi$year)

# convert to factor
fbi$year <- factor(fbi$year)
summary(fbi$year)

str(weekdays)
mode(weekdays)

str(weekdays_fac)
mode(weekdays_fac)

is.factor(weekdays_fac)
is.character(weekdays)
is.numeric()
is.logical()

as.factor(weekdays)
as.numeric(weekdays_fac)
as.numeric(weekdays)
as.numeric(c('1', '2', '100'))

years <- fbi$year
as.numeric(years)

as.numeric(weekdays_fac)
weekdays_fac

as.numeric(as.character(years))

levels(weekdays_fac)

# change the order of a factor variable #1
factor(weekdays_fac,
       levels = c("Mon", "Tue", 
                  "Wed", "Thr", "Fri"))

# change the order of a factor variable #2
levels(weekdays_fac) <- 
  c("Mon", "Tue", "Wed", "Thr", "Fri")
weekdays_fac

# change the order of a factor variable #3
?reorder
## make the order of the levels in one 
## variable dependent on the summary 
## statistic of another variable

fbi$type <- factor(fbi$type)
fbi %>% 
  ggplot(aes(x = type, y = log10(count))) + 
  geom_boxplot() +
  coord_flip()
levels(fbi$type)

fbi$type <- 
  factor(fbi$type, 
         levels=c("larceny", "burglary", 
                  "motor_vehicle_theft", 
                  "arson", "aggravated_assault", 
                  "robbery", "rape_legacy", 
                  "rape_revised", "homicide"))
levels(fbi$type)
fbi %>% ggplot(aes(x = type, y = log10(count))) + 
  geom_boxplot()


fbi$type <- reorder(fbi$type, 
                    fbi$count,
                    FUN = mean,
                    na.rm=TRUE)
levels(fbi$type)
fbi %>% ggplot(aes(x = type, y = log10(count))) + 
  geom_boxplot()


fbiwide %>% 
  ggplot(aes(x = factor(year),
             y = motor_vehicle_theft)) +
  geom_boxplot()

fbiwide %>% 
  mutate(
    mvt_rate = motor_vehicle_theft / 
      population * 100000
  ) %>% 
  ggplot(aes(x = state_abbr, y = mvt_rate)) +
  geom_boxplot() +
  coord_flip()

fbiwide %>% 
  mutate(
    mvt_rate = motor_vehicle_theft / 
      population * 100000
  ) %>% 
  ggplot(aes(x = reorder(state_abbr, 
                         mvt_rate,
                         FUN = median), 
             y = mvt_rate)) +
  geom_boxplot() +
  coord_flip() 

fbiwide %>% 
  mutate(
    larceny_rate = larceny / 
      population * 100000
  ) %>% 
  ggplot(aes(x = reorder(state_abbr, 
                         larceny_rate,
                         FUN = median), 
             y = larceny_rate)) +
  geom_boxplot() +
  coord_flip() 

levels(fbi$type)[7] <- "car_theft"
levels(fbi$type)









