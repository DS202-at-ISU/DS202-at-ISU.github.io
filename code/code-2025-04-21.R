library(Lahman)
library(tidyverse)

summary(HallOfFame )

url <- "https://www.baseball-reference.com/players/a/"
html <- read_html(url)
players_A <- html %>% 
  html_elements("#div_players_ a") %>% 
  html_text()

html %>% 
  html_elements("#div_players_ p")  %>% 
  html_text()

html %>% 
  html_elements("b") %>% 
  html_text()

html %>% 
  html_elements("b a") %>% 
  html_attr(name="href")

Abad_html <- read_html("https://www.baseball-reference.com/players/a/abadfe01.shtml")
Abad_df <- Abad_html %>% 
  html_elements(".p3 p , .p2 p, .p1 p, .stats_pullout strong") %>% 
  html_text() %>% 
  matrix(nrow = 2) %>% 
  as.data.frame()
colnames(Abad_df) <- Abad_df[1,]
Abad_df <- Abad_df[-1,]
Abad_df

Abrams_html <- read_html("https://www.baseball-reference.com/players/a/abramcj01.shtml")
player_col_names <- Abrams_html %>% 
  html_elements("span strong") %>% 
  html_text()
Abrams_df <- Abrams_html %>% 
  html_elements(".p3 p , .p2 p, .p1 p, .stats_pullout strong") %>% 
  html_text() %>% 
  matrix(ncol = length(player_col_names)) %>% 
  as.data.frame()
colnames(Abrams_df) <- Abrams_df[1,]
Abrams_df <- Abrams_df[-1,]
Abrams_df

extract_career_stats <- function(url){
  
  # pause 0.3 second
  Sys.sleep(0.3)
  
  html <- read_html(url)
  player_col_names <- html %>% 
    html_elements("span strong") %>% 
    html_text()
  df <- html %>% 
    html_elements(".p3 p , .p2 p, .p1 p, .stats_pullout strong") %>% 
    html_text() %>% 
    matrix(ncol = length(player_col_names)) %>% 
    as.data.frame()
  colnames(df) <- df[1,]
  df <- df[-1,]
  
  return(df)
}

# extract_career_stats("https://www.baseball-reference.com/players/a/abramcj01.shtml")
# extract_career_stats("https://www.baseball-reference.com/players/a/abadfe01.shtml")
# extract_career_stats("https://www.baseball-reference.com/players/a/abreujo02.shtml")

player_urls <- html %>% 
  html_elements("b a") %>% 
  html_attr(name="href")
player_urls <- paste0("https://www.baseball-reference.com", player_urls)

career_stats_list <- lapply(player_urls[1:6],
                            extract_career_stats)









