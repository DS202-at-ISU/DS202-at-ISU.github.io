library(tidyverse)

data(fbi, package="classdata")
fbi14 <- fbi %>% filter(year == 2014)
head(fbi14)

states <- map_data("state")
fbi14$region <- tolower(fbi14$state)

nomatch1 <- fbi14 %>% anti_join(states, by="region")
unique(nomatch1$region)

nomatch2 <- states %>% anti_join(fbi14, by="region")
# States for which we do not have crime data
unique(nomatch2$state)

fbi14_map <- fbi14 %>% left_join(states, by = 'region')
fbi14_map %>% 
  filter(type=="burglary") %>% 
  ggplot(aes(x = long, y = lat, 
             fill=count/population*100000)) +
  geom_polygon(aes(group=group))

tt <- fbi %>% 
  filter(year == 2020,
         type == 'burglary')
median_mvt <- median(tt$count / tt$population * 100)


fbi %>% 
  mutate(
    region = tolower(state)
  ) %>% 
  filter(year == 2020,
         type == 'burglary') %>% 
  left_join(states, by = 'region') %>% 
  ggplot(aes(x = long, y = lat,
             group = group,
             fill = count/population * 100)) +
  geom_polygon() +
  scale_fill_gradient2(
    low = 'red',
    high = 'blue',
    mid = 'white',
    midpoint = median_mvt
  ) +
  ggthemes::theme_economist(base_size = 5)


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
tables <- html_table(html)
bbwaa23 <- tables[[1]]

library(Lahman)
summary(HallOfFame$yearID)
bbwaa23
str(HallOfFame)

names(bbwaa23)[1] <- "First Lastname"
bbwaa23

People_needed_info <- People %>% 
  mutate(
    `First Lastname` = 
      paste(str_replace(nameFirst,"\\. ", "."), 
            nameLast)
  ) %>% 
  select(playerID, `First Lastname`)

bbwaa23 %>% 
  anti_join(People_needed_info, 
            by = 'First Lastname')
People %>% 
  filter(nameLast == "Dickey") %>% 
  select(nameLast, nameFirst)


bbwaa23 <- bbwaa23 %>% 
  left_join(People_needed_info, 
            by = 'First Lastname')

bbwaa23_modified <- bbwaa23 %>% 
  mutate(
    yearID = 2023,
    votedBy = 'BBWAA',
    ballots = 389,
    needed = 292,
    votes = Votes,
    inducted = if_else(votes >= needed, "Y", "N"),
    category = 'player',
    needed_note = NA
  ) %>% 
  select(colnames(HallOfFame))


