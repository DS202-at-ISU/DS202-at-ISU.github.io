library(dplyr)
library(ggplot2)
library(classdata)


# how many variables, how many observations does the data
# have? What do the variables mean?

dim(happy)
names(happy)
?happy

# Plot the variable happy. 

happy %>% 
  ggplot(aes(x = happy)) + geom_bar()

# Introduce a new variable nhappy that has values 1 for not too happy, 2 for pretty happy, 3 for very happy and NA for missing values. There are multiple ways to get to that. Avoid for loops.

# happy$nhappy <- as.numeric(happy$happy) # same thing as below
# happy <- happy %>% select(-nhappy)

happy <- happy %>% mutate(
  nhappy = as.numeric(happy)
)

summary(happy$nhappy)


# Based on the newly introduced numeric scores, what is the average happiness of respondents?

happy %>% 
  summarize(
    mean_happy = mean(nhappy, na.rm=TRUE)
  )

happy %>% 
  group_by(sex) %>%
  summarize(
    mean_happy = mean(nhappy, na.rm=TRUE)
  )

# how does average happiness change over the course of 
# a life time? 
# Is this relationship different for men and women? 
# Draw plots.

happy_avgs <- happy %>% 
  group_by(age, sex) %>%
  summarize(
    mean_happy = mean(nhappy, na.rm=TRUE)
  )

happy_avgs %>%
  filter(!is.na(sex)) %>%
  ggplot(aes(x = age, y = mean_happy, colour = sex)) +
  geom_point()

# are people now happier than ten years ago? How is happiness related to time?
