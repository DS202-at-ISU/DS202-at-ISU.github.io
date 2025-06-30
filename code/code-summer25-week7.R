library(Lahman)
summary(HallOfFame$yearID)

library(rvest)
url <- "https://en.wikipedia.org/wiki/2023_Baseball_Hall_of_Fame_balloting"
html <- read_html(url)
html

tables <- html |> html_table(fill=TRUE)
tables
length(tables)
tables[[1]]
tables[[2]]
tables[[3]]
tables[[4]]
tables[[5]]

hof <- "https://bbwaa.com/23-hof/#votingtable"
html <- read_html(hof)
hof_tbl <- html %>% html_table()
bbwaa <- hof_tbl[[1]]
names(bbwaa)[1] <- "First Lastname"
head(bbwaa)

library(Lahman)
summary(HallOfFame$yearID)

library(tidyverse)

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

People <- People %>% mutate(
  `First Lastname`=paste(`nameFirst`, `nameLast`)
)
bbwaa |> 
  left_join(
    People |> select(playerID, `First Lastname`),
    by = 'First Lastname'
  )

bbwaa |> 
  anti_join(
    People |> select(playerID, `First Lastname`),
    by = 'First Lastname'
  )

People |> 
  filter(nameLast %in% c("Dickey", "Hardy")) |> 
  select(playerID, `First Lastname`)

People <- People %>% mutate(
  `First Lastname` = paste(
    str_replace(nameFirst,"\\. ", "."),  # this uses a regular expression
    nameLast)
)
People |> 
  filter(nameLast %in% c("Dickey", "Hardy")) |> 
  select(playerID, `First Lastname`)
bbwaa |> 
  anti_join(
    People |> select(playerID, `First Lastname`),
    by = 'First Lastname'
  )

bbwaa <- bbwaa |> 
  left_join(
    People |> select(playerID, `First Lastname`),
    by = 'First Lastname'
  )

hof23 <- bbwaa |> 
  select(colnames(HallOfFame)) |> 
  arrange(playerID)
View(hof23)

HallOfFame |> 
  filter(yearID == 2023, 
         votedBy == 'BBWAA') |> 
  View()


player_a_url <- "https://www.baseball-reference.com/players/a/"
player_a_html <- read_html(player_a_url)
player_a_html |> 
  html_elements("b") |> 
  html_text()

player_a_html |> 
  html_elements("b a") |> 
  html_attr(name = "href")

fernando_url <- "https://www.baseball-reference.com/players/a/abadfe01.shtml"
fernando_html <- read_html(fernando_url)
stats_col_names <- fernando_html |> 
  html_elements("span strong") |> 
  html_text()
stats_details <- fernando_html |> 
  html_elements(".stats_pullout p") |> 
  html_text()

results <- matrix(
  stats_details, 
  ncol = length(stats_col_names)
)
colnames(results) <- stats_col_names
results <- as.data.frame(results)
results

url <- "https://www.baseball-reference.com/players/a/abbotan01.shtml"
html <- read_html(url)
stats_col_names <- html |> 
  html_elements("span strong") |> 
  html_text()
stats_details <- html |> 
  html_elements(".stats_pullout p") |> 
  html_text()

results <- matrix(
  stats_details, 
  ncol = length(stats_col_names)
)
colnames(results) <- stats_col_names
results <- as.data.frame(results)
results


html |> 
  html_elements(".stats_pullout") |> 
  html_text()


url <- "https://www.baseball-reference.com/awards/hof_2025.shtml"
library(rvest)
site <- read_html(url)
site %>% 
  html_element(css="#hof_BBWAA") %>% 
  html_table() %>% 
  head(3)
bbwaa <- site %>% html_element(css="#hof_BBWAA") %>% html_table() 
colnames(bbwaa) <- bbwaa[1,]
bbwaa <- bbwaa[-1,]
head(bbwaa)

mymean <- function(x) {
  return(sum(x)/length(x))
}
mymean(c(1,2,3))
mymean(1:10)
mymean(c(1:15, NA))

sum(c(1:15, NA), na.rm = TRUE)

mymean <- function(x, na.rm = F) {
  if (na.rm) x <- na.omit(x)
  return(sum(x)/length(x))
}

mymean(1:15)
mymean(c(1:15, NA))
mymean(c(1:15, NA), na.rm = TRUE)


library(rvest)
site <- read_html(url)
bbwaa <- site %>% 
  html_element("#hof_BBWAA") %>% 
  html_table()

bbwaa_scraper <- function(url) {
  site <- read_html(url)
  bbwaa <- site %>% 
    html_element("#hof_BBWAA") %>% 
    html_table()
  
  colnames(bbwaa) <- bbwaa[1,]
  bbwaa <- bbwaa[-1,]
  
  return(bbwaa)
}
bbwaa_scraper("https://www.baseball-reference.com/awards/hof_2025.shtml")
bbwaa_scraper("https://www.baseball-reference.com/awards/hof_2024.shtml")

bbwaa_scraper2 <- function(
    url, 
    css_selector = "#hof_BBWAA"
) {
  site <- read_html(url)
  bbwaa <- site %>% 
    html_element(css_selector) %>% 
    html_table()
  
  colnames(bbwaa) <- bbwaa[1,]
  bbwaa <- bbwaa[-1,]
  
  return(bbwaa)
}

bbwaa_scraper2("https://www.baseball-reference.com/awards/hof_2025.shtml",
               css_selector = "#hof_Veterans")


player_stats_scraper <- function(url) {
  Sys.sleep(0.5)
  html <- read_html(url)
  stats_col_names <- html |> 
    html_elements("span strong") |> 
    html_text()
  stats_details <- html |> 
    html_elements(".stats_pullout p") |> 
    html_text()
  
  results <- matrix(
    stats_details, 
    ncol = length(stats_col_names)
  )
  colnames(results) <- stats_col_names
  results <- as.data.frame(results)
  results
}

player_stats_scraper("https://www.baseball-reference.com/players/a/abbotan01.shtml")
player_stats_scraper("https://www.baseball-reference.com/players/a/abelmi01.shtml")


?mpg
scale_color_



mtcars %>% 
  ggplot(aes(x = mpg, colour=factor(cyl), y = 1)) + 
  geom_point(size = 5) +
  scale_color_brewer(type="qual")

mtcars %>% 
  ggplot(aes(x = mpg, colour=factor(cyl), y = 1)) + 
  geom_point(size = 5) +
  scale_color_brewer(palette = "Set3") +
  theme_bw()

scale_fill_manual()

