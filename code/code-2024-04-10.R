library(tidyverse)

counties <- map_data("county")

data(fbi, package="classdata")

fbi14 <- fbi %>% filter(year == 2014)
states <- map_data("state")

fbi14$region <- tolower(fbi14$state)
nomatch1 <- fbi14 %>% anti_join(states, by="region")
# States for which we do not have map data
unique(nomatch1$state)

nomatch2 <- states %>% anti_join(fbi14, by="region")
# States for which we do not have crime data
unique(nomatch2$state)

fbi.map <- fbi14 %>% left_join(states, by="region")

fbi.map %>% filter(type=="burglary") %>% 
  ggplot(aes(x = long, y = lat, fill=count/population*100000)) +
  geom_polygon(aes(group=group))

fbi_2020_mvt <- fbi %>% 
  mutate(
    region = tolower(state)
  ) %>% 
  filter(year == 2020, 
         type == "motor_vehicle_theft")
fbi_2020_mvt_map <- fbi_2020_mvt %>% 
  left_join(states, by = 'region')

median(fbi_2020_mvt$count / fbi_2020_mvt$population * 100000)

fbi_2020_mvt_map %>% 
  ggplot(aes(x = long, y = lat, group = group)) +
  geom_polygon(aes(fill = count/population*100000)) +
  scale_fill_gradient2(midpoint = 237.5) +
  ggthemes::theme_map()

library(rvest)
url <- "https://en.wikipedia.org/wiki/2023_Baseball_Hall_of_Fame_balloting"
html <- read_html(url)

tables <- html %>% html_table()
tables[[1]]
tables[[2]]
tables[[3]]

url <- "https://bbwaa.com/23-hof/#votingtable"
html <- read_html(url)

table_list <- html %>% html_table()
table <- table_list[[1]]











