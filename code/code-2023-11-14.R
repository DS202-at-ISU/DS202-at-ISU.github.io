library(tidyverse)
library(rvest)
# install.packages("rvest")
url <- "https://en.wikipedia.org/wiki/2023_Baseball_Hall_of_Fame_balloting"
html <- read_html(url)
html

tables <- html %>% html_table(fill=TRUE)
class(tables)

url <- "https://bbwaa.com/23-hof/#votingtable"
html <- read_html(url)
table_hof23 <- html %>% html_table()

# take the table for Hall of Fame 2023
bbwaa <- table_hof23[[1]]

library(Lahman)
HallOfFame

# The HallOfFame dataset only has data from 1936 to 2022
summary(HallOfFame$yearID)

HallOfFame %>% names()
# what we just scraped is the data for 2023
bbwaa %>% names()

# let's add these columns so that bbwaa matches HallOfFame
bbwaa <- bbwaa %>% mutate(
  yearID = 2023,
  votedBy = "BBWAA",
  ballots = 389,
  needed = 292,
  inducted = ifelse(Votes>=292, "Y", "N"),
  category = NA, # don't know yet
  needed_note = NA # not sure what would go here
) %>% rename(
  votes = Votes,
  `First Lastname` = Player
) %>% select(-Percent, -`Years on ballot`)

bbwaa

# the `First Lastname` column in bbwaa can be used to match
# players in People
# But we don't have `First Lastname` column in People yet. Let's create it.
People <- People %>% mutate(
  `First Lastname`= paste(`nameFirst`, `nameLast`)
)

# use anti_join to find rows in bbwaa that cannot be matched in People
bbwaa %>% anti_join(
  People %>% select(`First Lastname`, playerID), 
  by="First Lastname")

# check these players in People
People %>% 
  filter(nameLast %in% c("Dickey", "Hardy")) %>%
  select(playerID, nameFirst, nameLast)

# remove the write space in their "First" names
People <- People %>% mutate(
  `First Lastname` = paste(
    str_replace(nameFirst,"\\. ", "."),  # this uses a regular expression
    nameLast)
)
People %>% filter(nameLast %in% c("Dickey", "Hardy")) %>%
  select(playerID, `First Lastname`)

# left join so that we add playerID from People
bbwaa <- bbwaa %>% left_join(
  People %>% select(`First Lastname`, playerID), 
  by="First Lastname")

bbwaa

#######################
# these code is for SelectorGadget
url <- "https://www.baseball-reference.com/players/"
html <- read_html(url)

# use the css to extract bold (activate) players
activate_players <- html %>% 
  html_elements("strong a") %>% 
  html_text()
activate_players








