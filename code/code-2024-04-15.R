library(rvest)
library(tidyverse)
library(Lahman)

hof <- "https://bbwaa.com/23-hof/#votingtable"
html <- read_html(hof)
hof_tbl <- html %>% html_table()
bbwaa <- hof_tbl[[1]]
names(bbwaa)[1] <- "First Lastname"
head(bbwaa)

HallOfFame
head(HallOfFame)

bbwaa <- bbwaa %>% mutate(
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

# verify that `First Lastame` can be used as
# the id for joining

People <- People %>% mutate(
  `First Lastname` = paste(nameFirst, nameLast)
)

########################
tmp_result <- bbwaa %>% 
  left_join(People, by = "First Lastname")

tmp_result %>% filter(is.na(playerID)) %>% 
  select(`First Lastname`, playerID) %>% 
  unique()

People %>% filter(
  nameLast %in% c("Dickey", "Hardy")
) %>% 
  select(playerID, `First Lastname`)

# use anti_join to verify the id column
bbwaa %>% 
  anti_join(People, by = "First Lastname")

People <- People %>% mutate(
  `First Lastname` = paste(
    str_replace(nameFirst,"\\. ", "."),  # this uses a regular expression
    nameLast)
)
People %>% filter(
  nameLast %in% c("Dickey", "Hardy")
) %>% 
  select(playerID, `First Lastname`)
bbwaa %>% 
  anti_join(People, "First Lastname")
bbwaa <- bbwaa %>% 
  left_join(People %>% select(playerID, `First Lastname`), 
            "First Lastname")
View(bbwaa)

bbwaa %>% 
  select(names(HallOfFame))

# extract text (names) on this page
url <- "https://www.baseball-reference.com/players/"
html <- read_html(url)
html %>% 
  html_elements(".page_index div a") %>% 
  html_text()

# extract text (names) on this page
url <- "https://www.baseball-reference.com/players/a"
html <- read_html(url)
html %>% 
  html_elements("#div_players_ a") %>% 
  html_text()

url <- "https://www.baseball-reference.com/players/b"
html <- read_html(url)
html %>% 
  html_elements("#div_players_ a") %>% 
  html_text()

# different selector for different contents
url <- "https://www.baseball-reference.com/players/a"
html <- read_html(url)
html %>% 
  html_elements("#div_players_ p") %>% 
  html_text()

# extract url instead of text
url <- "https://www.baseball-reference.com/players/a"
html <- read_html(url)
html %>% 
  html_elements("#div_players_ a") %>% 
  html_attr(name = "href")


url <- "https://www.baseball-reference.com/players/a/abadfe01.shtml"
html <- read_html(url)
html %>% 
  html_elements(".stats_pullout div:nth-child(1) div p , span strong") %>% 
  html_text()

url <- "https://www.baseball-reference.com/players/a/abadfe01.shtml"
html <- read_html(url)
html %>% 
  html_elements(".p3 p , .p2 p, .p1 p, .stats_pullout p strong") %>% 
  html_text()








