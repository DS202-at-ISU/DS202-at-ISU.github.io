library(classdata)
library(tidyverse)

df <- data.frame(
  trt = c('a', 'a', 'b', 'b', 'c', 'c'),
  gender = c("M", "F", "M", "F", "M", "F"),
  value = c(10.51, 13.88, 15.37, 17.33, 18.60, 19.61),
  height = c(5, 5, 6, 6, 7, 7),
  weight = c(12, 10, 13, 11, 14, 12)
)

df %>% 
  group_by(gender) %>% 
  summarise(
    mean_value = mean(value)
  )

df %>% 
  group_by(gender, trt) %>% 
  summarise(
    mean_value = mean(value)
  )

library(classdata)
library(tidyverse)

str(happy)
?happy

happy %>% 
  ggplot(aes(x = happy)) +
  geom_bar()

happy <- happy %>% 
  mutate(
    nhappy = case_when(
      happy == 'not too happy' ~ 1,
      happy == 'pretty happy' ~ 2,
      happy == 'very happy' ~ 3,
      TRUE ~ NA
    )
  )

# happy %>% 
#   mutate(
#     nhappy = if_else(happy == 'not to happy', 1, happy),
#     nhappy = if_else(happy == 'pretty happy', 2, nhappy)
#   )
not_too_happy_index <- happy$happy == 'not too happy'
happy$nhappy[not_too_happy_index] <- 1

happy$nhappy <- as.numeric(happy$happy)

mean(happy$nhappy, na.rm = TRUE)


happy %>% 
  group_by(year) %>% 
  summarise(
    avg_happy = mean(nhappy, na.rm = TRUE)
  ) %>% 
  ggplot(aes(x = year, y = avg_happy)) +
  geom_line()

happy %>% 
  group_by(year, sex) %>% 
  summarise(
    avg_happy = mean(nhappy, na.rm = TRUE)
  ) %>% 
  ggplot(aes(x = year, y = avg_happy,
             color = sex)) +
  geom_line()

happy %>% 
  group_by(age) %>% 
  summarize(
    avg_happy = mean(nhappy, na.rm = T)
  ) %>% 
  ggplot(aes(x = age, y = avg_happy)) +
  geom_line()

happy %>% 
  group_by(age, sex) %>% 
  summarize(
    avg_happy = mean(nhappy, na.rm = T)
  ) %>% 
  drop_na() %>% 
  ggplot(aes(x = age, y = avg_happy,
             color = sex)) +
  geom_line()


happy %>% 
  group_by(partyid) %>% 
  summarize(
    avg_happy = mean(nhappy, na.rm = TRUE)
  ) %>% 
  ggplot(
    aes(x = partyid, y = avg_happy)
  ) +
  geom_col() +
  coord_flip()

happy %>% 
  group_by(partyid) %>% 
  summarize(
    avg_happy = mean(nhappy, na.rm = TRUE)
  ) %>% 
  ggplot(
    aes(x = partyid, weight = avg_happy)
  ) +
  geom_bar() +
  coord_flip()

happy %>% 
  group_by(finrela) %>% 
  summarize(
    avg_happy = mean(nhappy, na.rm = TRUE)
  ) %>% 
  ggplot(aes(x = finrela,
             y = avg_happy)) +
  geom_col() +
  coord_flip()

happy %>% 
  group_by(finrela, sex) %>% 
  summarize(
    avg_happy = mean(nhappy, na.rm = TRUE)
  ) %>% 
  ggplot(aes(x = finrela,
             y = avg_happy,
             fill = sex)) +
  geom_col(position = 'dodge') +
  coord_flip()

happy %>% 
  group_by(finrela, sex) %>% 
  summarize(
    avg_happy = mean(nhappy, na.rm = TRUE)
  ) %>% 
  ggplot(aes(x = finrela,
             y = avg_happy,
             fill = sex)) +
  geom_col(position = 'dodge') +
  facet_wrap(~sex) +
  coord_flip()

happy %>% 
  group_by(year, health) %>% 
  summarize(
    avg_happy = mean(nhappy, na.rm = TRUE)
  ) %>% 
  drop_na() %>% 
  ggplot(
    aes(x = year, y = avg_happy, color = health)
  ) +
  geom_line()

happy %>% 
  count(sex)


happy %>% group_by(sex, finrela) %>% 
  summarise(
    avg_happy = mean(nhappy, na.rm = TRUE)
  )

  












