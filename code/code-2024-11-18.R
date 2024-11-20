library(tidyverse)
library(classdata)

states <- map_data("state")
fbi14 <- fbi %>% filter(year == 2014)

fbi14$region <- tolower(fbi14$state)

nomatch1 <- fbi14 %>% anti_join(states, by="region")
unique(nomatch1$state)

nomatch2 <- states %>% anti_join(fbi14, by="region")
# States for which we do not have crime data
unique(nomatch2$state)

fbi.map <- fbi14 %>% left_join(states, by="region")
fbi.map %>% 
  filter(type=="burglary") %>% 
  ggplot(aes(x = long, y = lat)) +
  geom_polygon(aes(group = group,
                   fill = count/population))

fbi_20_mvt <- fbi %>% 
  filter(year == 2020, 
         type == 'motor_vehicle_theft') %>% 
  mutate(
    region = tolower(state),
    rate = count / population
  )

midpoint_value <- median(fbi_20_mvt$rate)

fbi_20_mvt %>% 
  left_join(states, by = 'region') %>% 
  ggplot(aes(x = long, y = lat, 
             group = group,
             fill = rate)) +
  geom_polygon() +
  scale_fill_gradient2(
    low = 'red',
    midpoint = midpoint_value) +
  ggthemes::theme_map()


library(rvest)
url <- "https://en.wikipedia.org/wiki/2023_Baseball_Hall_of_Fame_balloting"
html <- read_html(url)
html

tables <- html %>% html_table(fill=TRUE)

bbwaa <- tables[[3]]  # candidates on the BBWAA Ballot
vet1 <- tables[[5]] # Early Baseball Era Committee
vet2 <- tables[[6]] # Golden Days Era Committee
bbwaa %>% head()

url <- "https://bbwaa.com/23-hof/#votingtable"
html <- read_html(url)

tables <- html %>% html_table(fill = TRUE)
bbwaa23 <- tables[[1]]
names(bbwaa23)[1] <- "player_name"

bbwaa <- bbwaa23 %>% mutate(
  yearID = 2023,
  votedBy = "BBWAA",
  ballots = 389,
  needed = 292,
  inducted = ifelse(Votes>=292, "Y", "N"),
  category = NA, # don't know yet
  needed_note = NA # not sure what would go here
) %>% rename(
  votes = Votes
) %>% select(-Percent, -`Years on ballot`)


player_id <- People %>% 
  mutate(
    player_name = paste(nameFirst, nameLast)
  ) %>% 
  select(playerID, player_name)

bbwaa %>% anti_join(player_id, 
                    by = "player_name")

player_id %>% 
  filter(str_detect(player_name, "Hardy"))
player_id <- player_id %>% 
  mutate(
    player_name = str_replace(player_name,
                              "\\. ",
                              ".")
  )

HoF23 <- bbwaa %>% left_join(player_id, 
                    by = "player_name") %>% 
  select(
    names(HallOfFame)
  )







