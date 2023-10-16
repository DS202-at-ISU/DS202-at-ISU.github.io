library(tidyverse)
library(classdata)

av <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/avengers/avengers.csv", stringsAsFactors = FALSE)

deaths <- av %>% 
  pivot_longer(starts_with("Death"),
               names_to = "Time",
               values_to = "Died") %>% 
  select(URL, Name.Alias, Time, Died)

maxdeaths <- deaths %>% 
  mutate(
    Time = parse_number(Time)
  ) %>% 
  filter(Died != '') %>% 
  group_by(URL, Died) %>%  # Use URL instead of Alias
  summarise(
    Time = max(Time),
    .groups = 'drop'
  )

maxdeaths %>% 
  # ungroup() %>% 
  group_by(Died, Time) %>% 
  tally() %>% 
  mutate(
    n_time = Time * n
  ) %>% 
  filter(Died == 'YES') %>% 
  pull(n_time) %>% 
  sum()


maxdeaths %>% 
  filter(Died == 'YES') %>% 
  pull(Time) %>% 
  sum()


# Given the Avengers’ 53 years in operation and overall mortality rate, 
# fans of the comics can expect one current or former member to die every 
# seven months or so, with a permanent death occurring once every 20 months.

maxreturns <- av %>% 
  pivot_longer(starts_with("Return"),
               names_to = "Time",
               values_to = "Returned") %>% 
  select(URL, Name.Alias, Time, Returned) %>% 
  mutate(
    Time = parse_number(Time)
  ) %>% 
  filter(Returned != '') %>% 
  group_by(URL, Returned) %>% 
  summarise(
    Time = max(Time),
    .groups = 'drop'
  )

maxreturns %>% 
  filter(Returned == 'NO') %>% 
  nrow()

maxreturns %>% 
  group_by(Returned, Time) %>% 
  tally()

maxreturns %>% 
  group_by(Returned, Time) %>% 
  tally() %>% 
  filter(Returned == 'NO') %>% 
  pull(n) %>% sum()





maxdeaths <- av %>% 
  pivot_longer(starts_with("Death"),
               names_to = "Time",
               values_to = "Died") %>% 
  select(Name.Alias, Time, Died) %>% 
  mutate(
    Time = parse_number(Time)
  ) %>% 
  filter(Died != '') %>% 
  group_by(Name.Alias, Died) %>% 
  summarise(
    Time = max(Time)
  )


####
url <- "https://github.com/ds202-at-ISU/materials/blob/master/03_tidyverse/data/ames-liquor.rds?raw=TRUE"
download.file(url, "data/ames-liquor.rds", mode="wb")
ames <- readRDS("data/ames-liquor.rds")

ames$Date %>% head()

ames$`Store Location` %>% head()
ames$`Store Location` %>% head() %>% parse_number()

ames %>% head() %>% 
  separate(`Store Location`, 
           into = c("prefix", "lat", 'long'),
           sep = ' ') %>% 
  select(prefix, lat, long) %>% 
  mutate(
    lat = parse_number(lat),
    long = parse_number(long)
  )












