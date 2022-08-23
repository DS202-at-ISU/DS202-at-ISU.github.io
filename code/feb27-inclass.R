library(tidyverse)
ChickWeight <- ChickWeight %>% group_by(Diet)

ChickWeight %>% filter(Time==21) %>%
  ungroup(Diet) %>%
  mutate(
    Diet = reorder(Diet, weight, median)
  ) %>%
  ggplot(aes(x = Diet, y=weight)) + geom_boxplot()

data(french_fries, package="reshape2")
ffm <- french_fries %>% gather(key = scale,
                               value=score, 
                               potato:painty)
ffm %>% spread(rep, score) %>% 
  ggplot(aes(x = `1`, y=`2`)) + geom_point() +
  facet_wrap(~scale)


ffm %>% spread(time, score) %>% 
  ggplot(aes(x = `1`, y=`10`)) + 
  geom_point(aes(colour=subject, 
                 shape=factor(rep))) +
  facet_grid(treatment~scale)

######


library(classdata)

fbi <- fbiwide %>% gather(key=Type, value=Incidences,
                          Violent.crime:Motor.vehicle.theft)
fbi <- fbi %>% filter(!(Type %in% c("Violent.crime", "Property.crime")))
fbi <- fbi %>% mutate(
  Rate = Incidences/Population*70000
)
twostates <- fbi %>% filter(State %in% c("Iowa", "Minnesota"))
twostates %>% spread(State, Rate) %>% 
  ggplot(aes(x = Iowa, y=Minnesota)) + geom_point()

spreaded <- twostates %>% select(-Abb, -Population, -Incidences) %>% 
  spread(State, Rate)
spreaded %>%   ggplot(aes(x = Iowa, y=Minnesota)) + geom_point()
