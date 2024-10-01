library(classdata)
library(ggplot2)

d1 <- filter(fbi, 
             state == "Iowa", 
             type == "motor_vehicle_theft")
ggplot(d1, 
       aes(x = year, y = count)) +
  geom_line()

d2 <- filter(fbi,
             year == 2020,
             type == "motor_vehicle_theft")
ggplot(d2, 
       aes(x = state,
           y = count)) +
  geom_col() +
  coord_flip()

d3 <- filter(fbi,
             type == "homicide",
             year > 2015)
View(d3)
d3$rate <- d3$count / d3$population
threshold<- quantile(d3$rate, 0.90)
d3_90_percent <- filter(d3, 
                        rate > threshold)
d3_90_percent$year_state <- paste0(
  d3_90_percent$state, "-", d3_90_percent$year
)

ggplot(d3_90_percent,
       aes(
         x = year_state,
         y = rate
       )) +
  geom_col() +
  coord_flip()

ggplot(d3_90_percent,
       aes(
         x = reorder(year_state, rate),
         y = rate
       )) +
  geom_col() +
  coord_flip()

View(d3_90_percent)
nrow(fbi)
ncol(fbi)

quantile(1:100, 0.90)

a <- c(1, 15, 3, 20, 5, 8, 9, 10, 1, 3)
which(a == 1)
which(a > 3)
which.max(a)
which.min(a)

d5 <- filter(fbi,
             state == "California",
             type == "burglary")
sum(d5$count)

d6 <- filter(fbi,
             year == 1980)
d6$rate <- d6$count / d6$population
d6_burglary <- filter(d6, 
                      type == "motor_vehicle_theft")
which.max(d6_burglary$rate)
d6_burglary$state[which.max(d6_burglary$rate)]

find_year_type <- function(data, my_year, my_type) {
  tmp <- filter(data,
                year == my_year)
  tmp$rate <- tmp$count / tmp$population
  tmp_type <- filter(tmp, 
                     type == my_type)
  final_state <- tmp_type$state[which.max(tmp_type$rate)]
  return(final_state)
}
find_year_type(fbi, 1980, "burglary")

d7 <- filter(fbiwide,
             year == 2011,
             motor_vehicle_theft > robbery)
nrow(d7)
d7$state

f(x) %>% g(y, z, h, m, n)
g(f(x), y, z, h, m, n)

d8 <- filter(fbi, year == 1980)
ggplot(d8, aes())

filter(fbi, year == 1980) %>% 
  ggplot(aes())

fbi %>% 
  filter(year == 1980) %>% 
  select() %>% 
  mutate() %>% 
  arrange() %>% 
  ggplot()

fbi %>% 
  filter(year == 1980) %>% 
  head()
fbi$type %>% unique()
unique(fbi$type)

fbi %>% 
  mutate(
    rate = count / population,
    rate_100 = rate * 100,
    count = count * 10000000
  ) %>% 
  View()

t1 <- fbi %>% 
  mutate(
    rate = count / population,
    rate_100 = rate * 100,
    count = count * 10000000
  ) %>% 
  arrange(
    desc(year),
    type,
    desc(count)
  ) %>% 
  select(
    # year, count, type,
    # starts_with("state")
    
    # c(1,2,5,6)
    
    state:population
  )
t1







