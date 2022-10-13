av <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/avengers/avengers.csv", stringsAsFactors = FALSE)

library(tidyr)

deaths <- av %>% pivot_longer(
  col = starts_with("Death"), 
  names_to = "Time", 
  values_to="Died?") 
deaths %>% select(Name.Alias, `Died?`, Time)

deaths %>% group_by(`Died?`) %>% count()

events <- deaths %>% mutate(
  Time = readr::parse_number(Time)
) %>% select(Name.Alias, Time, `Died?`) %>% 
  filter(`Died?` != "") 

summary(factor(events$`Died?`))

# number of avengers total
nrow(av)

events %>% group_by(`Died?`) %>% tally()

events %>% filter(Time==1) %>% group_by(`Died?`) %>% tally()


events %>% group_by(Name.Alias, `Died?`) %>% tally() %>%
  filter(`Died?`=="YES") %>% dim()


