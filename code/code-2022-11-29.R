library(rvest)
?session

url <- "https://www.baseball-reference.com/awards/hof_2022.shtml"

site <- read_html(url)

site %>% html_table()

site %>% html_elements(css="table")

site %>% html_element(css="#hof_BBWAA") %>% html_table()

######
# tag for veterans table:

# scrape veterans: 
vet <- site %>% html_element(css="#hof_Veterans") %>% html_table()

readr::write_csv(vet,"temp.csv")
vet <- readr::read_csv("temp.csv", skip=1)
head(vet)
vet %>% View()
library(tidyverse)

vet <- vet %>% mutate(
  category = gsub("as ", "", `Inducted As`),
  yearID = 2022,
  ballots = NA,
  needed = NA,
  votes = NA,
  inducted= "Y",
  needed_note = NA
)

###########################

x <- c(1,3,6,9,10)

mean(x)

mymean <- function(z) {
  stopifnot(is.numeric(z))
  
  res <- sum(z)/length(z)
  return(res)
}

mymean(x)
mymean("hello")

mymean(c(x, NA))

mymean <- function(z, na.rm=FALSE) {
  stopifnot(is.numeric(z))
  if (na.rm) z <- na.omit(z)
  
  res <- sum(z)/length(z)
  return(res)
}

mymean(c(x, NA), na.rm=T)
mymean(x)

mymean <- function(z, na.rm=FALSE) {
#  browser()
  stopifnot(is.numeric(z))
  if (na.rm==TRUE) z <- na.omit(z)
  
  res <- sum(z)/length(z)
  return(res)
}

library(rvest)

bbwaa_data <- function(url) {
site <- read_html(url)
data <- site %>% html_element("#hof_BBWAA") %>% html_table()
readr::write_csv(data,"temp.csv")
read_csv("temp.csv")
}

bbwaa_data("https://www.baseball-reference.com/awards/hof_2021.shtml")
