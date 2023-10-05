library(classdata)
library(tidyverse)

"User/wju/Desktop/DS202/lab2/ss.png"
"ss.png"

data(french_fries, package="reshape2")
french_fries %>% head()

ffm <- french_fries %>% 
  pivot_longer(cols = potato:painty, 
               names_to = "scale", 
               values_to = "score")
ffm

# avergers' data
av <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/avengers/avengers.csv", stringsAsFactors = FALSE)

av %>% 
  select(Name.Alias, starts_with("Death")) %>% 
  head()

av %>% 
  pivot_longer(starts_with("Death"),
               names_to = "Time",
               values_to = "Died") %>% 
  select(URL, Name.Alias, Time, Died)


ffm %>% 
  pivot_wider(
    names_from = rep, values_from = score) %>%
  ggplot(aes(x = `1`, y = `2`)) + geom_point() +
  facet_wrap(~scale) + geom_abline(colour = "grey50")

ffm %>% head()

ffm %>% 
  pivot_wider(
    names_from = time, values_from = score
  ) %>% 
  ggplot(aes(x = `1`, y = `10`, 
             color = subject, shape = as.factor(rep))) +
  geom_point() +
  facet_grid(treatment ~ scale)

fbilong <- fbiwide %>% 
  pivot_longer(homicide:arson,
               names_to = "Type",
               values_to = "Incidences")
fbilong$crime_rate <- 
  fbilong$Incidences / fbilong$population * 90000  

# another way of doing this using mutate
fbilong <- fbiwide %>% 
  pivot_longer(homicide:arson,
               names_to = "Type",
               values_to = "Incidences") %>% 
  mutate(
    crime_rate = Incidences / population * 90000
  )

fbilong %>% 
  select(state_abbr, year, Type, crime_rate) %>% 
  pivot_wider(names_from = state_abbr,
              values_from = crime_rate) %>% 
  ggplot(aes(x = IA, y = CA, color = Type)) + 
  geom_point() 

fbi %>% 
  filter(year==2014, state_abbr %in% c("IA", "MN"),
         type=="burglary")

fbi %>% 
  filter(year==2014, state %in% c("Iowa", "Minnesota"),  
         type=="burglary") %>% 
  pivot_wider(names_from=state, values_from=count) %>% 
  view()

fbi %>% filter(year==2020, 
               state_abbr %in% c("IA", "MN"),
               type=="burglary") %>% 
  select(year, type, state, count) %>% 
  pivot_wider(names_from=state, values_from=count)









