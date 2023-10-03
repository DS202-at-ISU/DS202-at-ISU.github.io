library(classdata)
library(tidyverse)

summary(fbi$year)
str(fbi)

fbi$year <- factor(fbi$year)
summary(fbi$year)
str(fbi)

#
twoyear <- dplyr::filter(fbi, year %in% c(1980, 2016))
ggplot(data = twoyear, 
       aes(x = year, 
           y = count)) + 
  geom_boxplot()

mode(fbi$year)
str(fbi)

is.factor(fbi$year)
is.numeric(fbi$year)

mode(fbi$state)

as.factor(fbi$year)

as.numeric(fbi$year)
as.factor(as.character(fbi$year))

levels(fbi$year)

fbi %>% 
  ggplot(aes(x = type, y = log10(count))) + 
  geom_boxplot()
fbi$type <- as.factor(fbi$type)
levels(fbi$type)

fbi$type <- factor(fbi$type, 
                   levels=c("larceny", "burglary", 
                            "motor_vehicle_theft", 
                            "arson", "aggravated_assault", 
                            "robbery", "rape_legacy", 
                            "rape_revised", "homicide"))
fbi %>% 
  ggplot(aes(x = type, y = log10(count))) + 
  geom_boxplot()

fbi$type <- reorder(fbi$type, fbi$count, 
                    na.rm=TRUE)
fbi %>% ggplot(aes(x = type, y = log10(count))) + 
  geom_boxplot()



# Plot a boxplot of the number of motor vehicle thefts by year. 
# (you might have to convert year to a factor variable!)
fbiwide$year <- factor(fbiwide$year)

fbiwide %>% 
  ggplot(aes(x = year, y = motor_vehicle_theft)) +
  geom_boxplot()


# Plot a boxplot of the rate (adjust to some interpretable rate - e.g. Ames standard) of motor vehicle thefts by state (abbreviations). Add coord_flip() in case the state names run into one another.
fbiwide %>% 
  mutate(
    rate_mvt = motor_vehicle_theft / population * 90000
  ) %>% 
  ggplot(aes(x = state_abbr, y = rate_mvt)) +
  geom_boxplot() +
  coord_flip()

# Reorder the boxplots of rates of motor vehicle thefts, such that the boxplots are ordered by their medians.
fbiwide %>% 
  mutate(
    rate_mvt = motor_vehicle_theft / population * 90000,
    state_abbr = reorder(state_abbr, rate_mvt, 
                         median, na.rm = TRUE)
  ) %>% 
  ggplot(aes(x = state_abbr, y = rate_mvt)) +
  geom_boxplot() +
  coord_flip()

fbiwide_updated <- fbiwide %>% 
  mutate(
    rate_mvt = motor_vehicle_theft / population * 90000
  )

fbiwide_updated %>% mutate(
  state_abbr = reorder(state_abbr, rate_mvt, 
                       median, na.rm = TRUE)
) %>% 
  ggplot(aes(x = state_abbr, y = rate_mvt)) +
  geom_boxplot() +
  coord_flip()


# Plot (reordered) boxplots by state for another type of crime.
fbiwide %>% 
  mutate(
    rate_homicide = homicide / population * 90000,
    state_abbr = reorder(state_abbr, rate_homicide, 
                         median, na.rm = TRUE)
  ) %>% 
  ggplot(aes(x = state_abbr, y = rate_homicide)) +
  geom_boxplot() +
  coord_flip()

################################
# dplyr examples
data('happy')

# how many variables, how many observations does the data have? What do the variables mean?
dim(happy)
?happy

happy %>% 
  ggplot(aes(x = happy, color = health, fill = degree)) +
  geom_bar()

happy %>% 
  ggplot(aes(x = happy)) +
  geom_bar()

# Plot the variable happy. Introduce a new variable nhappy that has values 1 for not too happy, 2 for pretty happy, 3 for very happy and NA for missing values. There are multiple ways to get to that. Avoid for loops.
happy$nhappy <- as.numeric(happy$happy)

# Based on the newly introduced numeric scores, what is the average happiness of respondents?
mean(happy$nhappy, na.rm = TRUE)

# Are people now happier than previously? How does happiness evolve over time? Is this relationship different for men and women? Draw plots.
mean_nhappy_summary <- happy %>% 
  group_by(year) %>% 
  summarize(
    mean_nhappy = mean(nhappy, na.rm = TRUE)
  ) 

mean_nhappy_summary %>% 
  ggplot(aes(x = year, y = mean_nhappy)) +
  geom_line()

happy %>% ggplot(aes(x = as.factor(year), y = nhappy)) +
  geom_boxplot()


mean_nhappy_summary$sex <- 'combined'
happy %>% 
  group_by(year, sex) %>% 
  summarize(
    mean_nhappy = mean(nhappy, na.rm = TRUE)
  ) %>% 
  ggplot(aes(x = year, y = mean_nhappy, color = sex)) +
  geom_line() +
  geom_line(data = mean_nhappy_summary) +
  scale_color_manual(values = c('black', 'red', 'blue'))


happy_year_sex <- happy %>% 
  group_by(year, sex) %>% 
  summarize(
    mean_nhappy = mean(nhappy, na.rm = TRUE)
  )
happy_year_sex %>% 
  ggplot(aes(x = year, y = mean_nhappy, color = sex)) +
  geom_line() +
  geom_line(data = mean_nhappy_summary)


happy_year_sex %>% 
  ggplot() +
  geom_line(aes(x = year, y = mean_nhappy, color = sex)) +
  geom_line(data = mean_nhappy_summary, 
            aes(x = year, y = mean_nhappy, color = sex)) +
  geom_histogram(aes(x = year))


# how does average happiness change over the course of a life time? Is this relationship different for men and women? Draw plots.
# use age instead of year
mean_nhappy_summary <- happy %>% 
  group_by(age) %>% 
  summarize(
    mean_nhappy = mean(nhappy, na.rm = TRUE)
  ) 

mean_nhappy_summary %>% 
  ggplot(aes(x = age, y = mean_nhappy)) +
  geom_line()

happy %>% 
  filter(!is.na(sex)) %>% 
  group_by(age, sex) %>% 
  summarize(
    mean_nhappy = mean(nhappy, na.rm = TRUE)
  ) %>% 
  ggplot(aes(x = age, y = mean_nhappy, color = sex)) +
  geom_line()


happy_partyid <- happy %>% 
  group_by(partyid) %>% 
  summarise(
    avg_happiness = mean(nhappy, na.rm = TRUE)
  )

happy_partyid %>% ggplot() +
  geom_bar(aes(x = partyid, weight = avg_happiness))

happy_partyid %>% 
  ggplot(aes(x = partyid, y = avg_happiness)) +
  geom_col() +
  geom_line(aes(x = as.numeric(partyid)))


happy_partyid %>% ggplot() +
  geom_bar(aes(x = partyid))


happy %>% 
  group_by(finrela) %>% 
  summarise(
    avg_happiness = mean(nhappy, na.rm = TRUE)
  )






