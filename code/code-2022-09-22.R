library(classdata)
#View(fbiwide)
TRUE
as.numeric(TRUE)

FALSE
F 
as.numeric(F)

!F
!T

a <- c(1, 15, 3, 20, 5, 8, 9, 10, 1, 3)
# your turn

# less than 20

a < 20

# squared value is at least 100 or less than 10

(a^2 >= 100) | (a^2 < 10)

a[(a^2 >= 100) | (a^2 < 10)]

a[!((a^2 >= 100) | (a^2 < 10))]


# equals 1 or 3
(a == 1) | (a == 3)
a %in% c(1, 3)

# a is even
# Hint: have a look at the help for the operator %%

a %% 2 == 0

birthyear <- c(82, 91, 2001, 2011, 1932, 2003)

1900 + birthyear %% 1900

#####
library(dplyr)

filter(fbiwide, homicide == 1)

nrow(filter(fbiwide, homicide == 0))
nrow(filter(fbiwide, homicide <= 6))

library(classdata)
filter(fbi, state=="IA")
library(dplyr)
dplyr::filter(fbi, state_abbr=="IA")

################
# your turn 

# Get a subset of all crimes in Iowa, 
# Plot incidences/rates for one type of crime over time.
names(fbi)
iowa_crimes <- filter(fbi, state_abbr=="IA")
dim(iowa_crimes)

iowa_crimes <- fbi %>% filter(state_abbr =="IA")

library(ggplot2)
iowa_crimes %>%
  filter(type == "homicide") %>%
  ggplot(aes(x =year, y = count/population*90000)) +
  geom_point()

fbi %>% 
  filter(state_abbr %in% c("MN", "IA", "ND")) %>%
  filter(type == "motor_vehicle_theft", year >= 2010) %>%
  ggplot(aes(x =year, y = count/population*90000, color = state_abbr)) +
  geom_point(size=5)




# Get a subset of all crimes in 2020. Plot the number or rate for one type of crime by state.

Get a subset of the data that includes number of homicides for the last five years. Find the rate of homicides, extract all states that have a rate of greater than 90% of the rates across all states, and plot (Hint: ?quantile).



