library(classdata)
library(tidyverse)

happy
head(happy)
str(happy)
?happy
dim(happy)

happy %>% 
  ggplot(aes(x = happy)) +
  geom_bar()


levels(happy$happy)

# use `as.numeric()`
happy <- happy %>% 
  mutate(
    nhappy = as.numeric(happy)
  )

# if_else
happy %>% mutate(
  nhappy = NA,
  nhappy = if_else(happy == 'not too happy',
                   1, nhappy),
  nhappy = if_else(happy == 'pretty happy',
                   2, nhappy),
  nhappy = if_else(happy == 'very happy',
                   3, nhappy)
)

mean(happy$nhappy, na.rm = TRUE)
happy$nhappy %>% mean(na.rm = TRUE)

library(haven)
happy %>% 
  ggplot(aes(x = year, y = nhappy)) +
  geom_point(alpha = 0.01)

happy %>% 
  group_by(year) %>% 
  summarise(
    avg_happy = mean(nhappy, na.rm = TRUE)
  ) %>% ggplot(aes(x = year, y = avg_happy)) +
  geom_line()

happy %>% 
  group_by(year, sex) %>% 
  summarise(
    avg_happy = mean(nhappy, na.rm = TRUE)
  ) %>% ggplot(aes(x = year, y = avg_happy,
                   color = sex)) +
  geom_line()


happy %>% 
  filter(!is.na(nhappy)) %>% 
  group_by(age, sex) %>% 
  summarise(
    avg_happy = mean(nhappy, na.rm = TRUE)
  ) %>% filter(!is.na(sex)) %>% 
  ggplot(aes(x = age, y = avg_happy,
                   color = sex)) +
  geom_line()

happy %>% 
  group_by(partyid) %>% 
  summarise(
    avg_happy = mean(nhappy, na.rm = TRUE)
  )
happy %>% 
  group_by(partyid) %>% 
  summarise(
    avg_happy = mean(nhappy, na.rm = TRUE)
  ) %>% ggplot(aes(x = partyid)) +
  geom_bar(aes(weight = avg_happy)) +
  coord_flip()

happy %>% 
  group_by(finrela) %>% 
  summarise(
    avg_happy = mean(nhappy, na.rm = TRUE)
  )

happy %>% 
  group_by(finrela, sex) %>% 
  summarise(
    avg_happy = mean(nhappy, na.rm = TRUE)
  ) %>% 
  filter(!is.na(finrela),
         !is.na(sex)) %>% 
  ggplot(aes(x = finrela)) +
  geom_bar(aes(weight = avg_happy,
               fill = sex), 
           position = "dodge") +
  coord_flip()

happy %>% 
  group_by(finrela, sex) %>% 
  summarise(
    avg_happy = mean(nhappy, na.rm = TRUE)
  ) %>% ungroup()

happy %>% 
  group_by(finrela, sex) %>% 
  summarise(
    avg_happy = mean(nhappy, na.rm = TRUE),
    .groups = 'drop'
  ) 



