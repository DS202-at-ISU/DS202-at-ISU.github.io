library(classdata)
library(tidyr)
library(dplyr)
library(ggplot2)

fbi <- fbiwide %>% gather(key=Type, value="Incidences",
                          Violent.crime:Motor.vehicle.theft)

twostates <- fbi %>% filter(State %in% c("Iowa", "Minnesota"))
sidebyside <- twostates %>% spread(State, Incidences)
head(sidebyside)

mini <- twostates %>% filter(Year==2014, Type=="Burglary")
mini %>% spread(State, Incidences)
mini %>% select(-Abb,-Population) %>% spread(State, Incidences)

sidebyside <- twostates %>% select(-Abb,-Population) %>% 
  spread(State, Incidences)
sidebyside %>% ggplot(aes(x = Iowa, y=Minnesota)) +
  geom_point(aes(colour=Type))

sidebyside %>% filter(is.na(Minnesota)) %>% head()
###############

url <- "https://data.iowa.gov/api/views/3adi-mht4/rows.csv"
campaign <- readr::read_csv(url)
campaign %>% glimpse()

library(readr)
# Check the help for the function parse_number in the readr package and use it on the campaign expenditure data.
campaign$`Expenditure Amount` <- parse_number(campaign$`Expenditure Amount`)

# or, equivalently
campaign <- campaign %>% mutate(
  `Expenditure Amount` = parse_number(`Expenditure Amount`)
)
# better use a temporary data frame



# Use separate to split the date variable into year, month and day.

tmp <- campaign %>% separate(Date, into=c("month","day", "year"))
campaign <- tmp


campaign %>% ggplot(aes(x = year)) + geom_bar()
campaign %>% ggplot(aes(x = year, 
                        weight=`Expenditure Amount`)) + 
  geom_bar()

#####
# extract geographic lat and long:

tmp <- campaign %>% separate(`City Coordinates`, 
                      into=c("foo","line2"),
                      sep="\n") %>%
  select(-foo)
campaign <- tmp

tmp <- campaign %>% separate(line2, 
                             into=c("lat", "long"),
                             sep=",") 
