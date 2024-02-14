library(ggplot2)
library(classdata)

data("mpg")
str(mpg)
?mpg

# scatter plot: cty vs hwy
ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point()

# scatter plot: cty vs hwy, color by manufacturer
ggplot(mpg, aes(x = cty, y = hwy,
                color = manufacturer)) +
  geom_point()

# scatter plot: cty vs hwy, facet by manufacturer
ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point() +
  facet_wrap(~ manufacturer)

# side-by-side boxplot of cty, by manufacturer
ggplot(mpg, aes(x = manufacturer, 
                y = cty)) +
  geom_boxplot()

ggplot(mpg, aes(x = manufacturer, 
                y = cty)) +
  geom_boxplot() +
  coord_flip()

# histogram of cty
ggplot(mpg, aes(x = cty)) +
  geom_histogram(binwidth = 1)

fbi

ggplot(fbi, aes(x = violent_crime)) +
  geom_bar()

ggplot(fbi, aes(x = violent_crime)) +
  geom_bar(aes(weight = count))

ggplot(fbi, aes(x = violent_crime)) +
  geom_bar(aes(weight = count)) +
  facet_wrap(~ type)

ggplot(fbi, aes(x = violent_crime, fill = type)) +
  geom_bar(aes(weight = count))
  
ggplot(fbi, aes(x = count)) +
  geom_histogram() +
  facet_wrap(~ type, scales = "free_x")

#########
# logic varaibles
logic_var <- c(TRUE, TRUE, FALSE, FALSE)

x <- c(1, 2, 3, 4, 5, 6)
x == 1
x > 3
x %in% c(2, 4, 8)

A <- c(T, T, F, F)
B <- c(T, F, T, F)
A & B
A | B

a <- c(1, 15, 3, 20, 5, 8, 9, 10, 1, 3)
a < 20
(a^2 >= 100) | (a^2 < 10)
a == 1 | a == 3
a %in% c(1, 3)
(a %% 2) == 0

library(dplyr)


# Get a subset of all crimes in Iowa, 
# Plot incidences/rates for one type of crime over time.
fbi$state == "Iowa"
df_iowa <- filter(fbi, state == "Iowa")
ggplot(filter(df_iowa, type == 'larceny'),
       aes(x = year, y = count)) +
  geom_line()

# for rate
ggplot(filter(df_iowa, type == 'larceny'),
       aes(x = year, y = count/population)) +
  geom_line()

ggplot(df_iowa,
       aes(x = year, y = count, color = type)) +
  geom_line()


# Get a subset of all crimes in 2020. 
# Plot the number or rate for one type of crime by state.
df_2020 <- filter(fbi, year == 2020)
ggplot(filter(df_2020, type == 'larceny'),
       aes(x = state_abbr)) +
  geom_bar(aes(weight = count)) +
  coord_flip()

ggplot(df_2020,
       aes(x = state_abbr)) +
  geom_bar(aes(weight = count, fill = type)) +
  coord_flip()

# Get a subset of the data that includes number of 
# homicides for the last five years. 
# Find the rate of homicides, extract all states 
# that have a rate of greater than 90% of the 
# rates across all states, and plot (Hint: ?quantile).

df_homicide_16_20 <- 
  filter(fbi, year >= 2016, type == 'homicide')
df_homicide_16_20$rate <- 
  df_homicide_16_20$count / df_homicide_16_20$population * 100000

quantile(1:100, 0.9)
rate_90 <- quantile(df_homicide_16_20$rate, 0.9)
filter(df_homicide_16_20, rate >= rate_90)
ggplot(filter(df_homicide_16_20, rate >= rate_90), 
       aes(x = year, y = rate, color = state)) +
  geom_line()







