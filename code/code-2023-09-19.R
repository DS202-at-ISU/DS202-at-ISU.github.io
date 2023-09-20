library(classdata)

a <- c(1, 15, 3, 20, 5, 8, 9, 10, 1, 3)

# less than 20
a < 20

# less than or equal to 20
a <= 20

# squared value at least 100
a^2 >= 100

# squared value less than 10
a^2 < 10

# squared value at least 100 or less than 10
(a^2 >= 100) | (a^2 < 10)

# equal to 1 or 3
(a == 1) | (a == 3)
a %in% c(1, 3)

# even
a %% 2 == 0

# subset the even values
a[a %% 2 == 0]

# negation
!c(FALSE, TRUE, F, T)

library(classdata)
library(dplyr)
library(ggplot2)

# Your turn
filter(fbi, state_abbr == 'IA')
# or equivalently
iowa_crimes <- fbi %>% filter(state_abbr == 'IA')

# scatter plot
iowa_crimes %>% filter(type == 'homicide') %>% 
  ggplot(aes(x = year, y = count)) +
  geom_point()

# line chart
iowa_crimes %>% filter(type == 'homicide') %>% 
  ggplot(aes(x = year, y = count)) +
  geom_line()

# crime by state
fbi %>% 
  filter(year == 2020, type == 'homicide') %>% 
  ggplot(aes(x = state_abbr, y = count)) +
  geom_col() +
  coord_flip()

# last 5 years
last_five_years <- fbi %>% 
  filter(year > 2015, type == 'homicide')

# calculate the rate
last_five_years$rate <- 
  last_five_years$count / last_five_years$population * 10000

View(last_five_years )

threshold <- quantile(last_five_years$rate, .9)
result <- last_five_years %>% filter(rate > threshold) 
result$state %>% unique()


# demonstrate `which`
a
which(a == 1)
a[c(1, 9)]
a[which(a == 1)]

a[which.max(a)]

# how many reports of Burglaries are there for California?
CA_burglary <- fbi %>% filter(type == 'burglary',
                              state_abbr == 'CA')
sum(CA_burglary$count)

fbi %>% 
  filter(type == 'burglary',
         state_abbr == 'CA') %>%
  pull(count) %>% 
  sum()

# for any of the violent crimes, which state had the highest rate (and for which crime) in 1980? in 2020?
fbi$rate <- fbi$count / fbi$population * 10000
# robbery
robbery_1980 <- fbi %>% 
  filter(type == 'robbery', year == 1980)
robbery_1980$state[which.max(robbery_1980$rate)]

robbery_2020 <- fbi %>%
  filter(type == 'robbery', year == 2020)
robbery_2020$state[which.max(robbery_2020$rate)]

# in how many states in 2011 were there more vehicle thefts than robberies? (which states are those?)
fbiwide %>% filter(year == 2011, 
                   motor_vehicle_theft > robbery) %>% 
  nrow()

fbiwide %>% filter(year == 2011, 
                   motor_vehicle_theft > robbery) %>% 
  select(state, year, motor_vehicle_theft, robbery) %>% 
  pull(state) %>% 
  length()

