library(dplyr)
library(ggplot2)
library(classdata)


# how many variables, how many observations does the data
# have? What do the variables mean?

dim(happy)
names(happy)

happy <- happy %>% mutate(
  nhappy = as.numeric(happy)
)

summary(happy$nhappy)


happy_means <- happy %>%
  group_by(age) %>%
  summarize(
    mean_happy = mean(nhappy, na.rm=TRUE),
    n = n(),
    sd_happy = sd(nhappy, na.rm=TRUE),
    se_happy = sd_happy/sqrt(n)
  ) 

happy_means %>%
  ggplot(aes(x = age, y = mean_happy)) + geom_point()

happy_age_sex <- happy %>%
  group_by(age, sex) %>%
  summarize(
    mean_happy = mean(nhappy, na.rm=TRUE),
    n = n(),
    sd_happy = sd(nhappy, na.rm=TRUE),
    se_happy = sd_happy/sqrt(n)
  ) 

happy_age_sex %>%
  filter(n > 10) %>%
  ggplot(aes(x = age, y = mean_happy, colour = sex)) + 
  geom_point()

happy_year_sex <- happy %>%
  group_by(year, sex) %>%
  summarize(
    mean_happy = mean(nhappy, na.rm=TRUE),
    n = n(),
    sd_happy = sd(nhappy, na.rm=TRUE),
    se_happy = sd_happy/sqrt(n)
  ) %>%
  filter(n > 10)
  
happy_year_sex %>% filter(year==2021)

happy_year_sex %>%
  ggplot(aes(x = year, y = mean_happy, colour = sex)) + 
  geom_point()


str(happy_year_sex)

str(fbi)
head(fbi)

fbi <- fbi %>% mutate(
  type = factor(type)
)
head(fbi)

summary(fbi$type)

fbi %>% group_by(type) %>% summarize(n = n())
fbi %>% group_by(type) %>% tally()

###

summary(fbi$year)
summary(fbi$state_id) # mean is non-sensical
fbi$state_id <- factor(fbi$state_id)
summary(fbi$state_id)

fbi %>% filter(state_id == 12)  # something is wrong in the data
