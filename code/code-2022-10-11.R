library(classdata)
library(tidyverse)

# library(help="forcats") # for additional reading

fbi %>% View()

summary(fbi)

fbi <- fbi %>% mutate(
  type = factor(type),
  state_abbr = factor(state_abbr),
  state = factor(state)
)
summary(fbi)

fbi %>% 
  filter(type=="arson") %>%
  ggplot(aes(x = factor(state_id),  y = count/population*100000)) +
  geom_boxplot()

fbi %>% filter(type=="arson", is.na(count))

# a bit on missing values:
NA == NA # still NA
is.na(NA)
is.na(c(1,2,3,NA))

levels(fbi$type)
fbi$type <- factor(fbi$type, levels=c("larceny", "burglary", "motor_vehicle_theft", "arson", "aggravated_assault", "robbery", "rape_legacy", "rape_revised", "homicide"))
levels(fbi$type)

?reorder


fbi %>% 
  ggplot(aes(x = type,  y = log10(count/population*100000))) +
  geom_boxplot()

fbi <- fbi %>% mutate(
  type = reorder(type, log10(count/population*100000), mean)
)

fbi %>% 
  ggplot(aes(x = type,  y = log10(count/population*100000))) +
  geom_boxplot()

sort(c(NA, 1, 2, 5, NA,  3, 2))
order(c(NA, 1, 2, 5, NA,  3, 2))

fbi <- fbi %>% mutate(
  type = reorder(type, log10(count/population*100000), 
                 mean, na.rm=TRUE)
)

fbi %>% 
  ggplot(aes(x = type,  y = log10(count/population*100000))) +
  geom_boxplot()

fbi <- fbi %>% mutate(
  type = reorder(type, log10(count/population*100000), 
                 median, na.rm=TRUE)
)

fbi %>% 
  ggplot(aes(x = type,  y = log10(count/population*100000))) +
  geom_boxplot()

##########
# For this your turn use the fbiwide object from the classdata 
# package.

data(fbiwide)
# Plot a boxplot of the number of motor vehicle thefts by year. 
# (you might have to convert year to a factor variable!)

fbiwide %>% 
  ggplot(aes(x = factor(year), y = motor_vehicle_theft)) +
  geom_boxplot()

# Plot a boxplot of the rate (adjust to some interpretable rate - e.g. Ames standard) 
# of motor vehicle thefts by state (abbreviations). Add coord_flip() in case the state names run into one another.

fbiwide %>% 
  ggplot(aes(x = factor(year), y = 100000*motor_vehicle_theft/population)) +
  geom_boxplot()

fbiwide %>% 
  ggplot(aes(x = factor(state_abbr), y = 100000*motor_vehicle_theft/population)) +
  geom_boxplot()

# Reorder the boxplots of rates of motor vehicle thefts, 
# such that the boxplots are ordered by their medians.

fbiwide %>% 
  mutate(
    state_abbr = factor(state_abbr),
    state_abbr = reorder(state_abbr, 100000*motor_vehicle_theft/population, median, na.rm=TRUE)
  ) %>%
  ggplot(aes(x = state_abbr, y = 100000*motor_vehicle_theft/population)) +
  geom_boxplot()

# Plot (reordered) boxplots by state for another type of crime.
