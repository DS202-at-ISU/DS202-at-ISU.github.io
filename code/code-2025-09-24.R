library(tidyverse)
library(classdata)

x <- 1:5
x |> mean()

fbi_new <- fbi |> 
  mutate(
    rate = count / population * 100,
    rate2 = rate + 10,
    rate3 = rate + rate2,
    population = log(population)
  )

fbi |> 
  mutate(
    rate = count / population * 100,
    rate2 = rate + 10,
    rate3 = rate + rate2,
    population = log(population)
  )


fbi |> 
  select(
    c(1, 2, 3)
  ) |> 
  head()

fbi |> 
  select(
    state, population, type, count
  ) |> 
  head()

fbi |> 
  select(
    c("state", "population", "type")
  ) |> 
  head()

fbi |> 
  select(
    starts_with("state")
  ) |> 
  head()

fbi |> 
  select(
    -state
  ) |> 
  head()

fbi |> 
  select( # data frame result
    state
  )

fbi$state
fbi |> 
  pull(state) # returns a vector

fbiwide |> 
  select(
    7:16
  )

fbiwide |> 
  select(
    homicide,
    rape_legacy,
    rape_revised,
    robbery,
    aggravated_assault,
    property_crime,
    burglary,
    larceny,
    motor_vehicle_theft,
    arson
  )

fbiwide |> 
  select(
    homicide:arson
  )

fbiwide |> 
  select(
    colnames(fbiwide)[7:16]
  )

fbiwide |> 
  summarise(
    population_mean = mean(population),
    pop_sd = sd(population),
    pop_median = median(population)
  )

df <- tibble(
  type = c('a', 'a', 'b', 'b',
           'c', 'c'),
  class = rep(c("classA", "classB"), 3),
  value = c(1,2, 4,5, 7,8)
)

df |> 
  summarise(
    mean_value = mean(value)
  )

df |> 
  group_by(type, class) |> 
  summarise(
    mean_value = mean(value)
  )

iowa_larceny_data <- filter(fbi,
                            state == "Iowa", 
                            type == 'larceny')
iowa_larceny_data$rate <- 
  iowa_larceny_data$count / iowa_larceny_data$population
ggplot(iowa_larceny_data,
       aes(x = year, y = rate)) +
  geom_line()

fbi |> 
  filter(
    state == 'Iowa', 
    type == "larceny"
  ) |> 
  mutate(
    rate = count / population * 1000
  ) |> 
  ggplot(aes(x = year, y = rate)) +
  geom_line()

data <- filter(fbi, 
               type == 'homicide',
               year %in% c(2016, 2017, 2018, 2019, 2020))
data$rate <- data$count / data$population
threshold <- quantile(data$rate, 0.9)
data_plot <- filter(data, 
                    rate > threshold) 
ggplot(data_plot,
       aes(x = state_abbr, y = rate)) +
  geom_col()

fbi |> 
  filter(
    type == 'homicide',
    year %in% c(2016, 2017, 2018, 2019, 2020)
  ) |> 
  mutate(
    rate = count / population * 1000
  ) |> 
  filter(
    rate > quantile(rate, 0.9)
  ) |> 
  ggplot(aes(x = state_abbr, y = rate)) +
  geom_col()


d2 <- filter(fbi, violent_crime == TRUE,
             year == 1980)
d2$rate <- d2$count / d2$population
d2[which.max(d2$rate), c("type", "rate")]

fbi |> 
  filter(
    violent_crime == TRUE,
    year == 1980
  ) |> 
  mutate(
    rate = count / population
  ) |> 
  arrange(
    desc(rate)
  ) |> 
  select(rate, type, state) |> 
  View()

fbi |> 
  filter(
    violent_crime == TRUE,
    year %in% 2016:2020
  ) |> 
  mutate(
    rate = count / population
  ) |> 
  filter(type != "rape_revised") |> 
  group_by(type, year) |> 
  summarise(
    highest_rate = max(rate, na.rm = TRUE),
    state_highest_rate = state[which.max(rate)]
  ) 

fbi |> 
  filter(
    violent_crime == TRUE,
    year %in% 2016:2020
  ) |> 
  mutate(
    rate = count / population
  ) |> 
  filter(type != "rape_revised") |> 
  group_by(type, year) |> 
  arrange(desc(rate)) |>
  summarise(
    highest_rate = rate[1],
    top3_state = list(state[1:3])
  )



