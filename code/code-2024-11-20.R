library(rvest)
library(tidyverse)

url <- "http://www.baseball-reference.com/players/a/"
html <- read_html(url)
html %>% 
  html_elements("#div_players_ a") %>% 
  html_text()


text <- html %>% 
  html_elements("#div_players_ p") %>% 
  html_text()
df <- data.frame(
  text = text
)

df %>% 
  separate(text, into = c("name", "career"))


html %>% 
  html_elements("#div_players_ a") %>% 
  html_attr(name = 'href')

html <- read_html("https://www.baseball-reference.com/players/a/abadfe01.shtml")
html %>% 
  html_elements(".p3 p , .p2 p, .p1 p, .stats_pullout strong") %>% 
  html_text()

col_names <- html %>% 
  html_elements("span strong") %>% 
  html_text()

stats_values <- html %>% 
  html_elements(".p3 p , .p2 p, .p1 p, .stats_pullout p strong") %>% 
  html_text()

df <- matrix(stats_values, nrow = 1) %>% 
  as.data.frame()
names(df) <- col_names
df

url <- "https://www.baseball-reference.com/players/a/abreubr01.shtml"
html <- read_html(url)
col_names <- html %>% 
  html_elements("span strong") %>% 
  html_text()
stats_values <- html %>% 
  html_elements(".p3 p , .p2 p, .p1 p, .stats_pullout p strong") %>% 
  html_text()
df <- matrix(stats_values, 
             ncol = length(col_names)) %>% 
  as.data.frame()
names(df) <- col_names
df

url <- "https://www.baseball-reference.com/awards/hof_2022.shtml"
site <- read_html(url)
df <- site %>% 
  html_element(css = "#hof_BBWAA") %>% 
  html_table()
colnames(df) <- df[1,]
df <- df[-1, ]


mymean <- function(x) {
  return(sum(x)/length(x))
}
mymean <- function(x, na.rm = FALSE) {
  result <- sum(x) / length(x)
  
  return(result)
}
mymean(1:15)

foo <- function(x, y = 5) {
  return(x + y)
}
foo(x = 1, y = 2)
foo(x = 1)

foo(1, 4)
foo(2)

foo(y = 2, x = 7)





url <- "https://www.baseball-reference.com/awards/hof_2022.shtml"
scrape_bbwaa <- function(url) {
  site <- read_html(url)
  bbwaa <- site %>% 
    html_element("#hof_BBWAA") %>% 
    html_table()
  colnames(bbwaa) <- bbwaa[1,]
  bbwaa <- bbwaa[-1, ]
  return(bbwaa)
}
scrape_bbwaa(url)
url2 <- "https://www.baseball-reference.com/awards/hof_2021.shtml"
scrape_bbwaa(url2)

urls <- paste0(
  "https://www.baseball-reference.com/awards/hof_",
  2020:2024,
  ".shtml")
data_list <- lapply(urls, scrape_bbwaa)

url <- "https://www.baseball-reference.com/players/a/abreubr01.shtml"

scrape_player <- function(url) {
  html <- read_html(url)
  col_names <- html %>% 
    html_elements("span strong") %>% 
    html_text()
  stats_values <- html %>% 
    html_elements(".p3 p , .p2 p, .p1 p, .stats_pullout p strong") %>% 
    html_text()
  df <- matrix(stats_values, 
               ncol = length(col_names)) %>% 
    as.data.frame()
  names(df) <- col_names
  df # return(df)
}
url <- "https://www.baseball-reference.com/players/a/abreubr01.shtml"
scrape_player(url)

player_a_url <- 
  read_html("http://www.baseball-reference.com/players/a/") %>% 
  html_elements("#div_players_ a") %>% 
  html_attr(name = 'href')
player_a_url <- 
  paste0("https://www.baseball-reference.com",
         player_a_url)
lapply(player_a_url[1:10], scrape_player)










