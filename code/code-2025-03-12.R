library(tidyverse)

data <- data.frame(
  treatment = c("a", "b", "a", "b", "a", "b"),
  patient = c("John Smith", "John Smith", "Jane Doe", "Jane Doe", "Mary Johnson", "Mary Johnson"),
  score = c(NA, 18, 4, 1, 6, 7)
)

data$unique_id <- 1:6
data %>%
  select(-unique_id) %>%
  pivot_wider(
    names_from = treatment,
    values_from = score
  )

library(classdata)
fbi %>% filter(year==2014, 
               state_abbr %in% c("IA", "MN"),
               type=="burglary") %>% 
  select(-state_id, -state_abbr,
         -population) %>% 
  pivot_wider(
    names_from = "state",
    values_from = "count"
  ) 

View(deaths)
maxdeaths <- deaths %>% 
  mutate(
    Time = parse_number(Time)
  ) %>% 
  group_by(URL, Died) %>% 
  summarise(
    total_death = max(Time)
  ) %>% 
  filter(Died != "")
  
maxdeaths %>% 
  ungroup() %>% 
  count(Died, total_death)

maxdeaths %>% 
  group_by(Died, total_death) %>% 
  tally()


# url <- "https://github.com/ds202-at-ISU/materials/blob/master/03_tidyverse/data/ames-liquor.rds?raw=TRUE"
# download.file(url, "ames-liquor.rds", mode="wb")
ames <- readRDS("data/ames-liquor.rds")

tt <- ames %>% head()
parse_number(tt$`Store Location`)
ames_cleaned <- ames %>% 
  separate(
    `Store Location`,
    into = c("prefix", "long", "lat"),
    sep = ' '
  ) %>% 
  mutate(
    lat = parse_number(lat),
    long = parse_number(long)
  )
ames_cleaned %>% View()
sum(ames_cleaned$`Sale (Dollars)`, na.rm = TRUE)
max(ames_cleaned$`Sale (Dollars)`, na.rm = TRUE)
max(ames_cleaned$`Volume Sold (Gallons)`, na.rm = TRUE)

ames_cleaned %>% 
  ggplot(aes(x = long, y = lat)) +
  geom_point()

mean_long <- mean(ames_cleaned$long, na.rm = TRUE)
mean_lat <- mean(ames_cleaned$lat, na.rm = TRUE)

library(ggmap)
# ggmap::register_google() with your API first
# see ?ggmap::register_google for details
ames_map = get_map(location = c(lon = mean_long, 
                           lat = mean_lat), 
              zoom = 13, maptype = 'roadmap')
ggmap(ames_map) +
  geom_point(data = ames_cleaned,
             aes(x = long, y = lat),
             size = 0.1, alpha = 0.1)
