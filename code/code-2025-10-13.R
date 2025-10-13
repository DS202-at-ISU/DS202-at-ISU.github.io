library(tidyverse)
library(classdata)

fbiwide |> 
  pivot_longer(
    cols = homicide:arson,
    names_to = "Type",
    values_to = "Incidences"
  ) |> 
  mutate( rate = Incidences / population * 1000) |> 
  filter( state %in% c("Iowa", "Minnesota") ) |> 
  select(
    state_abbr, year, Type, rate
  ) |> 
  arrange(year, Type ) |> 
  select(year, Type, state_abbr, rate ) |>
  pivot_wider(
    names_from = c("state_abbr"),
    values_from = "rate"
  ) |> 
  ggplot(aes(x = IA, y = MN,
             color = Type)) +
  geom_point() + 
  geom_abline()


deaths <- av |> 
  select(
    URL,
    Name.Alias,
    starts_with("Death")
  ) |> 
  pivot_longer(
    Death1:Death5,
    names_to = "Time",
    values_to = "Died"
  )

maxdeaths <- deaths |> 
  mutate(
    Time = parse_number(Time)
  ) |> 
  group_by(URL, Died) |> 
  summarise(
    total_death = max(Time)
  ) |> 
  filter(Died != "")

maxdeaths |> 
  group_by(total_death, Died) |> 
  summarise(
    n = n()
  )

maxdeaths |> 
  group_by(total_death, Died) |> 
  tally()

maxdeaths |> 
  ungroup() |> 
  count(total_death, Died)

df <- data.frame(x = c(NA, "a,b", "a,d", "b,c"))
df
df %>% separate(x, into = c("A", "B"),
                sep = ",")  


ames <- readRDS("data/ames-liquor.rds")
str(ames)
dim(ames)  
#  View(ames)

tt <- ames |> head()
parse_number(tt$`Store Location`)
ames_modified <- ames |> 
  separate(
    `Store Location`,
    into = c("prefix", "long", "lat"),
    sep = " "
  ) |> 
  mutate(
    lat = parse_number(lat),
    long = parse_number(long)
  )

sum(ames$`Sale (Dollars)`, na.rm = TRUE)
ames$Date <- lubridate::mdy(ames$Date)
range(ames$Date)
max(ames$`Sale (Dollars)`, na.rm=T)

ames_modified |> 
  ggplot(aes(x=long, y = lat)) +
  geom_point()


# install.packages("ggmap")
library(ggmap)

# Replace 'your_secret_api' with your actual Google Maps API key
register_google(key = "your_secret_api") 

# Define location (e.g., a city name or longitude/latitude coordinates)
location_name <- "Ames" 

# Get the map
ames_map <- get_map(location = location_name, 
                    maptype = "terrain", 
                    source = "google", 
                    zoom = 13) 

ggmap::ggmap(ames_map) +
  geom_point(aes(x = long, y = lat),
             data = ames_modified,
             alpha = 0.5)






