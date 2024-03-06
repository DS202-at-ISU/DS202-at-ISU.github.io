library(classdata)
library(tidyverse)

# Use pivot_longer from the tidyr package to combine 
# the variables for the different types of crimes into 
# one variable. Call the key-value pair "Type" and 
# "Incidences". Compute a crime rate
data("fbiwide")

fbi_long <- fbiwide %>% 
  pivot_longer(
    homicide:arson,
    names_to = "Type",
    values_to = "Incidences"
  ) %>% mutate(
    rate = Incidences / population * 10000
  )

IA_MN_crime <- fbi_long %>% 
  filter(state %in% c("Iowa", "Minnesota")) %>% 
  pivot_wider(
    names_from = state,
    values_from = Incidences
  )

IA_MN_crime <- fbi_long %>% 
  filter(state %in% c("Iowa", "Minnesota")) %>% 
  select(state, year, Type, rate) %>% 
  pivot_wider(
    names_from = state,
    values_from = rate
  )
IA_MN_crime %>% 
  ggplot(aes(x = Iowa, y = Minnesota,
             color = Type)) +
  geom_point()


fbi %>% filter(year==2014, state_abbr %in% c("IA", "MN"),
               type=="burglary")
fbi %>% filter(year==2014, state %in% c("Iowa", "Minnesota"),  type=="burglary") %>% 
  pivot_wider(names_from=state, values_from=count) %>% 
  View()

fbi %>% filter(year==2020, 
               state_abbr %in% c("IA", "MN"),
               type=="burglary") %>% 
  select(year, type, state, count) %>% 
  pivot_wider(names_from=state, values_from=count)

# example of pivot_longer
av <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/avengers/avengers.csv", stringsAsFactors = FALSE)

deaths <- av %>% select(
  URL, 
  Name.Alias,
  starts_with("Death")
) %>% pivot_longer(
  cols = Death1:Death5,
  names_to = "Time",
  values_to = "Died"
)

deaths <- deaths %>% mutate(
  Time = parse_number(Time)
)
maxdeaths <- deaths %>% 
  filter(Died != "") %>% 
  group_by(URL, Died) %>% 
  summarise(
    Time_max = max(Time, na.rm = TRUE),
    .groups = "drop"
  )

maxdeaths %>% count(Time_max, Died)


url <- "https://github.com/ds202-at-ISU/materials/blob/master/03_tidyverse/data/ames-liquor.rds?raw=TRUE"
download.file(url, "ames-liquor.rds", mode="wb")
ames <- readRDS("ames-liquor.rds")

parse_number(ames$`Store Location`)

ames <- ames %>% 
  separate(`Store Location`, 
           into = c("prefix", "lat", "long"),
           sep = ' ') %>% 
  mutate(
    lat = parse_number(lat),
    long = parse_number(long)
  )

ames %>% ggplot(aes(x = lat, y = long)) +
  geom_point()





