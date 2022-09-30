# Get a subset of all crimes in 2020. 
# Plot the number or rate for one type of crime by state.

library(classdata)
library(ggplot2)
library(dplyr)

y2020 <- fbi %>% filter(year == 2020) 

fbi %>% filter(year %in% c(2010, 2020))  %>%
  filter(type=="motor_vehicle_theft") %>%
  ggplot(
    aes(x = state_abbr, 
        y = count/population*90000, 
        colour = year)) +
  geom_point()

fbi %>% filter(year %in% c(2010, 2020))  %>% 
  filter(type=="motor-vehicle-theft") %>% 
  ggplot(
    aes(x = state_abbr, 
        y = count/population*90000, 
        colour = year)) +
  geom_point()


fbi %>% 
  mutate(
    rate = count/population*90000
  ) %>% View()

fbi %>% arrange(desc(year), count) %>% head()

# Your turn
# Use the fbiwide data set from the classdata package
# Write out at least three different ways of selecting all variables describing incidences of different types of crimes

fbiwide %>%
  select(homicide:arson)

fbiwide %>%
  select(7:16)

fbiwide %>%
  select(homicide, rape_legacy, rape_revised, robbery, aggravated_assault)

fbiwide %>% 
  select(-(1:6))

fbi %>%
  mutate(
    rate = count/population*90000
  ) %>%
  summarize(
    mean_rate = mean(rate, na.rm=TRUE),
    sd_rate = sd(rate, na.rm = TRUE),
    median_rate = median(rate, na.rm = TRUE)
  )

fbi %>%
  mutate(
    rate = count/population*90000
  ) %>%
  group_by(type, state_abbr) %>%
  summarize(
    mean_rate = mean(rate, na.rm=TRUE),
    sd_rate = sd(rate, na.rm = TRUE),
    median_rate = median(rate, na.rm = TRUE)
  ) %>%
  ggplot(aes(x = state_abbr, y = mean_rate, colour = type)) +
  geom_point()

?happy

happy %>% 
  ggplot(aes( x = happy)) + geom_bar()

happy <- happy %>%
  mutate(
    nhappy = as.numeric(happy)
  )

happy %>% 
  ggplot(aes( x = nhappy)) + geom_bar()

happy %>% 
  summarize(
    mean = mean(nhappy, na.rm=TRUE)
  )
