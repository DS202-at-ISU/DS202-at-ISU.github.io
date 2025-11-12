library(rvest)
library(tidyverse)

player_url <- "https://www.baseball-reference.com/players/a/abbotan01.shtml"
# player_url <- "https://www.baseball-reference.com/players/a/abadfe01.shtml"
html <- read_html(player_url)
table_colnames <- html |> 
  html_elements("span strong") |> 
  html_text()
table_contents <- html |> 
  html_elements(".p3 p , .p2 p, .p1 p, .stats_pullout p strong") |> 
  html_text()
table_contents <- 
  matrix(table_contents, ncol = length(table_colnames))
colnames(table_contents) <- table_colnames
table_contents <- as.data.frame(table_contents)
View(table_contents)


url <- "https://www.baseball-reference.com/awards/hof_2025.shtml"
html_hof <- read_html(url)
tables <- html_table(html_hof)
tables

bbwaa_table <- html_hof |> 
  html_element("#hof_BBWAA") |> 
  html_table()

hw <- function() {
  print("hello world!")
}
hw()
# hw
# mean

mymean <- function(x) {
  n <- length(x)
  s <- sum(x)
  result <- s / n
  return(result)
}
mymean(1:5)
# mymean(c(1:5, NA))
# mymean()

mymean <- function(x = 1:3) {
  n <- length(x)
  s <- sum(x)
  result <- s / n
  return(result)
}
mymean()

mymean <- function(x = 1:3) {
  n <- length(x)
  s <- sum(x)
  result <- s / n
  result # you don't have to call the return()
}
mymean()

mymean <- function(x = 1:3) sum(x)/length(x)
mymean()

mymean <- function(x, na.rm = FALSE) {
  if(na.rm) {
    x <- na.omit(x)
  }
  n <- length(x)
  s <- sum(x)
  result <- s / n
  return(result)
}

mymean(c(1:5, NA))
mymean(c(1:5, NA), na.rm = TRUE)


bbwaa_scraper <- function(url) {
  # url <- "https://www.baseball-reference.com/awards/hof_2025.shtml"
  html <- read_html(url)
  data_table <- html |> 
    html_element("#hof_BBWAA") |> 
    html_table()
  colnames(data_table) <- data_table[1,]
  data_table <- data_table[-1,]
  data_table
}
bbwaa_scraper("https://www.baseball-reference.com/awards/hof_2025.shtml")
bbwaa_scraper("https://www.baseball-reference.com/awards/hof_2024.shtml")
bbwaa_scraper("https://www.baseball-reference.com/awards/hof_2023.shtml")

url_vec <- paste0("https://www.baseball-reference.com/awards/hof_",
                  2000:2025,
                  ".shtml")

table_container <- list()

for (i in seq_along(url_vec)) {
  Sys.sleep(0.3)
  url <- url_vec[i]
  table_container[[i]] <- bbwaa_scraper(url)
}

table_container


bbwaa_scraper <- function(url, css_selector = "#hof_BBWAA") {
  # url <- "https://www.baseball-reference.com/awards/hof_2025.shtml"
  html <- read_html(url)
  data_table <- html |> 
    html_element(css_selector) |> 
    html_table()
  colnames(data_table) <- data_table[1,]
  data_table <- data_table[-1,]
  data_table
}
bbwaa_scraper("https://www.baseball-reference.com/awards/hof_2025.shtml",
              css_selector = "#hof_Veterans")

