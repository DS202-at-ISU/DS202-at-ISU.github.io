library(tidyverse)
library(classdata)

fbilong <- fbiwide %>% 
  pivot_longer(
    homicide:arson,
    names_to = "Type",
    values_to = "Incidences"
  )
fbilong <- fbilong %>% mutate(
  rate = Incidences / population * 100000
)

IA_MN <- fbilong %>% 
  filter(state %in% c("Iowa", "Minnesota")) %>%
  select(
    state, year, Type, rate
  ) %>% 
  pivot_wider(
    names_from = state,
    values_from = rate
  ) %>% 
  ggplot(aes(x = Iowa, y = Minnesota,
             color = Type))+
  geom_point()
IA_MN



fbi %>% filter(year==2014, state_abbr %in% c("IA", "MN"),
               type=="burglary")
fbi %>% 
  filter(year==2014, 
         state %in% c("Iowa", "Minnesota"),  
         type=="burglary") %>% 
  pivot_wider(names_from=state, values_from=count) %>% 
  View()

fbi %>% filter(year==2020, 
               state_abbr %in% c("IA", "MN"),
               type=="burglary") %>% 
  select(year, type, state, count) %>% 
  pivot_wider(names_from=state, values_from=count)

av <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/avengers/avengers.csv", stringsAsFactors = FALSE)

deaths <- av %>% 
  pivot_longer(
    starts_with("Death"),
    names_to = "Time",
    values_to = "Died"
  ) %>% 
  select(
    URL, Name.Alias,
    Time, Died
  )

View(deaths)
deaths <- deaths %>% 
  mutate(
    Time = parse_number(Time)
  )

maxdeaths <- deaths %>% 
  group_by(URL, Died) %>% 
  summarise(
    max_death = max(Time)
  )

View(maxdeaths)

maxdeaths %>% 
  filter(Died != "") %>% 
  ungroup() %>% 
  select(-URL) %>% 
  count(Died, max_death)

url <- "https://github.com/ds202-at-ISU/materials/blob/master/03_tidyverse/data/ames-liquor.rds?raw=TRUE"
# download.file(url, "data/ames-liquor.rds", mode="wb")
ames <- readRDS("data/ames-liquor.rds")
View(ames)

tt <- ames %>% head()
parse_number(tt$`Store Location`)
ames <- ames %>% 
  separate(`Store Location`, 
           into = c("prefix", "long", "lat"),
           sep = " ",
           ) %>% 
  mutate(
    long = parse_number(long),
    lat = parse_number(lat)
  ) 
View(tt)

sum(ames$`Sale (Dollars)`, na.rm = TRUE)
total_sales <- ames %>% 
  separate(Date,
           into = c("month", "day", "year"),
           sep = '/') %>% 
  group_by(year) %>% 
  summarise(
    total_sales = sum(`Sale (Dollars)`, na.rm = TRUE)
  ) 
total_sales %>% 
  ggplot(aes(x = year, y = total_sales)) +
  geom_line()

max(ames$`Sale (Dollars)`, na.rm = TRUE)

ames %>% ggplot(
  aes(x = long, y = lat)
) +
  geom_point()











