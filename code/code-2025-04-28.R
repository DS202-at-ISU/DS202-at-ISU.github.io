mymean <- function(x) {
  return(sum(x)/length(x))
}

mymean(1:15)

mymean <- function(x) return(sum(x)/length(x))
mymean(1:15)

mymean(c(1:15, NA))

mean(c(1:15, NA), na.rm = TRUE)

mymean <- function(x, na.rm=F) {
  if (na.rm) x <- na.omit(x)
  return(sum(x)/length(x))
}
mymean(1:15, na.rm = TRUE)
mymean(c(1:15, NA))
mymean(c(1:15, NA), na.rm = TRUE)

foo <- function(a, b, c = 'c') {
  print(paste(a, b, c))
}
foo('a', 'b')
foo('a', 'b', 'e')
foo('a')

foo2 <- function() {
  print("hello world")
}
foo2()
foo2
foo
mean

# url first
url <- "https://www.baseball-reference.com/awards/hof_2024.shtml"

# get site
site <- read_html(url)

# scrape the table
table <- site %>%
  html_element("#hof_BBWAA") %>% 
  html_table()

hof_scraper <- function(url){
  # url first
  # url <- "https://www.baseball-reference.com/awards/hof_2024.shtml"
  
  # get site
  site <- read_html(url)
  
  # scrape the table
  table <- site %>%
    html_element("#hof_BBWAA") %>% 
    html_table()
  
  return(table)
  
}
hof_scraper(url)

hof_scraper <- function(site){

  # scrape the table
  table <- site %>%
    html_element("#hof_BBWAA") %>% 
    html_table()
  
  return(table)
  
}

site <- read_html(url)
hof_scraper(site)

hof_scraper <- function(url, element = '#hof_BBWAA'){
  
  # get site
  site <- read_html(url)
  
  # scrape the table
  table <- site %>%
    html_element(element) %>% 
    html_table()
  
  return(table)
  
}

hof_scraper(url)
hof_scraper(url, element = '#hof_Veterans')

library(tidyverse)
p1 <- mpg %>% filter(year == 2008) %>%
  ggplot(aes(x = cty, y = hwy, colour = cyl)) +
  geom_point()
p1 +
  scale_color_gradient(low = "#fb421a")

p2 <- mpg %>% filter(year == 2008) %>%
  ggplot(aes(x = cty, y = hwy, colour = factor(cyl))) +
  geom_point()
p2 +
  # scale_color_hue(l = 45, c = 70)
  scale_color_brewer(type="qual",
                     palette = "YlOrRd")
library(RColorBrewer)
display.brewer.all()







