library(tidyverse)
library(classdata)

av <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/avengers/avengers.csv", stringsAsFactors = FALSE)

deaths <- av %>% 
  pivot_longer(starts_with("Death"),
               names_to = "Time",
               values_to = "Died") %>% 
  select(URL, Name.Alias, Time, Died)

# deaths$Time <- parse_number(deaths$Time)
maxdeaths <- deaths %>% 
  mutate(
    Time = parse_number(Time)
  ) %>% 
  filter(Died != '') %>% 
  group_by(URL, Died) %>% 
  summarise(
    Time = max(Time)
  )

# if we want to include all steps into one pipeline
maxdeaths <- av %>% 
  pivot_longer(starts_with("Death"),
               names_to = "Time",
               values_to = "Died") %>% 
  select(URL, Name.Alias, Time, Died) %>% 
  mutate(
    Time = parse_number(Time)
  ) %>% 
  filter(Died != '') %>% 
  group_by(URL, Died) %>% 
  summarise(
    Time = max(Time)
  )

maxdeaths %>% 
  ungroup() %>% 
  group_by(Died, Time) %>% 
  tally()


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






