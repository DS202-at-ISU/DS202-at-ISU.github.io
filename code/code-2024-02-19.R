# example of `which()`
x <- c(1, 4, 5, 2, 3, 8, 6, 7)
x == 3
which(x == 3)
which.max(x)
which.min(x)

library(classdata)
library(tidyverse)

burglary_CA <- filter(fbi, state == 'California',
       type == 'burglary')
sum(burglary_CA$count)

# finding the highest burglary rate in 1980
fbi$rate <- fbi$count / fbi$population * 100000
fbi_1980 <- filter(fbi, year == 1980)
fbi_1980_burglary <- filter(fbi_1980, type == 'burglary')
max(fbi_1980_burglary$rate, na.rm = TRUE)

fbiwide_2011 <- filter(fbiwide, year == 2011)
tt <- fbiwide_2011$motor_vehicle_theft > fbiwide_2011$robbery
sum(tt)
which(tt)
fbiwide_2011$state[which(tt)]

# pipe operator
which(tt)
tt %>% which()

filter(fbiwide, year == 2011)
fbiwide %>% filter(year == 2011)

filter(filter(fbi, year == 1980), type == 'burglary')
fbi %>% filter(year == 1980) %>% 
  filter(type == 'burglary')

fbi %>% mutate(
  rate = count / population,
  rate_log = log(rate)
)


fbi$rate <- fbi$count / fbi$population * 100000
fbi_1980 <- filter(fbi, )
fbi_1980_burglary <- filter(fbi_1980, type == 'burglary')
max(fbi_1980_burglary$rate, na.rm = TRUE)

fbi %>% mutate(
  rate = count / population * 100000
) %>% filter(
  year == 1980,
  type == 'burglary'
) %>% arrange(desc(rate)) %>% 
  # select(state, year, type, rate)
  # select(-state)
  # select(1:5)
  select(starts_with("state"))
  
# different ways of selection
fbiwide %>% select(c("larceny", "arson"))

fbiwide %>% select(-(1:6))

fbiwide %>% select(7:16)

fbiwide %>% select(homicide:arson)






