library(tidyverse)

library(rvest)
url <- "https://en.wikipedia.org/wiki/2023_Baseball_Hall_of_Fame_balloting"
html <- read_html(url)
html

tables <- html_table(html)

url <- "https://bbwaa.com/23-hof/#votingtable"
html <- read_html(url)
tables <- html |> html_table()
hof_23 <- tables[[1]]


library(Lahman)
View(HallOfFame)

HallOfFame |> 
  filter(yearID == 2022,
         votedBy == 'BBWAA') |> 
  View()

hof_23 <- hof_23 |> 
  mutate(
    yearID = 2023,
    votedBy = 'BBWAA',
    ballots = 389,
    needed = 292,
    votes = Votes,
    inducted = if_else(votes >= needed, "Y", "N"),
    category = 'player',
    needed_note = NA
  )

People <- People |> 
  mutate(
    Player = paste(
      str_replace(nameFirst, "\\. ", "\\."), 
      nameLast)
  )

hof_23 |> 
  anti_join(People |> select(Player, playerID),
            by = 'Player')

hof_23 <- hof_23 |> 
  left_join(People |> select(Player, playerID),
            by = 'Player')
# View(hof_23)

# People |> 
#   filter(nameLast == 'Hardy') |> 
#   select(playerID, Player)

hof_23_cleaned <- hof_23 |> 
  select(colnames(HallOfFame))
View(hof_23_cleaned)

View(HallOfFame |> 
       filter(yearID == 2022))

url2 <- "https://www.baseball-reference.com/players/a/"
html2 <- read_html(url2)

html2 |> 
  html_elements("b a") |> 
  html_attr("href")

player_url <- "https://www.baseball-reference.com/players/a/abadfe01.shtml"
html <- read_html(player_url)
table_colnames <- html |> 
  html_elements("span strong") |> 
  html_text()
table_contents <- html |> 
  html_elements(".p3 p , .p2 p, .p1 p, .stats_pullout p strong") |> 
  html_text()

player_url <- "https://www.baseball-reference.com/players/a/abbotan01.shtml"
html <- read_html(player_url)
table_colnames <- html |> 
  html_elements("span strong") |> 
  html_text()
table_contents <- html |> 
  html_elements(".p3 p , .p2 p, .p1 p, .stats_pullout p strong") |> 
  html_text()



