library(tidyverse)
library(classdata)

av <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/avengers/avengers.csv", stringsAsFactors = FALSE)

deaths <- av %>% 
  pivot_longer(starts_with("Death"),
               names_to = "Time",
               values_to = "Died") %>% 
  select(URL, Name.Alias, Time, Died) %>% 
  mutate(
    Time = parse_number(Time)
  ) %>% 
  filter(Died != '')

maxdeaths <- deaths %>% group_by(URL, Died) %>% 
  summarise(
    Time = max(Time), .groups = 'drop'
  )

maxdeaths %>% select(-URL) %>% 
  group_by(Died, Time) %>% tally()

url <- "https://github.com/ds202-at-ISU/materials/blob/master/03_tidyverse/data/ames-liquor.rds?raw=TRUE"
download.file(url, "data/ames-liquor.rds", mode="wb")
ames <- readRDS("data/ames-liquor.rds")
