?mean
mean(x, trim = 0, na.rm = FALSE, ...)

mymean <- function(x, na.rm.my = FALSE) {
  if (na.rm.my) {
    x <- na.omit(x)
  }
  
  return(sum(x)/length(x))
}

mymean(c(1:3, NA))

mymean(c(1:3, NA), na.rm.my = TRUE)



library(rvest)
url <- "https://www.baseball-reference.com/awards/hof_2021.shtml"
site <- read_html(url)
bbwaa <- site %>% html_element("#hof_BBWAA") %>% html_table()
bbwaa

bbwaa_scraper <- function(url) {
  site <- read_html(url)
  bbwaa <- site %>% html_element("#hof_BBWAA") %>% html_table()
  bbwaa
  # or you can do: 
  # return(bbwaa)
}

bbwaa_scraper("https://www.baseball-reference.com/awards/hof_2021.shtml")
bbwaa_scraper("https://www.baseball-reference.com/awards/hof_2022.shtml")
bbwaa_scraper("https://www.baseball-reference.com/awards/hof_2023.shtml")


bbwaa_scraper2 <- function(url, element = "#hof_Veterans") {
  site <- read_html(url)
  bbwaa <- site %>% html_element(element) %>% html_table()
  bbwaa
  # or you can do: 
  # return(bbwaa)
}

bbwaa_scraper2("https://www.baseball-reference.com/awards/hof_2022.shtml")
bbwaa_scraper2("https://www.baseball-reference.com/awards/hof_2022.shtml",
               element = "#hof_BBWAA")







