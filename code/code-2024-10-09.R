library(classdata)
library(tidyverse)

fbiwide %>% 
  mutate(
    rate = motor_vehicle_theft / population * 100000
  ) %>% 
  ggplot(
    aes(x = reorder(state_abbr,
                    rate, 
                    median),
        y = rate)
  ) + 
  geom_boxplot() +
  coord_flip()

fct <- factor(
  c('a', 'b', 'c', 'a', 'c', 'b'),
  levels = c('a', 'b', 'c')
)
levels(fct)
levels(fct)[2] <- 'banana'
levels(fct)
fct

happy
?happy

str(happy)
happy$happy
levels(happy$happy)

# 1
happy$nhappy <- NA
happy$nhappy[which(
  happy$happy == 'not too happy'
  )] <- 1
happy$nhappy[which(
  happy$happy == 'pretty happy'
)] <- 2
happy$nhappy[which(
  happy$happy == 'very happy'
)] <- 3
happy$nhappy

# 2
happy <- happy %>% 
  mutate(
    nhappy = if_else(happy == 'not too happy',
                     1, NA),
    nhappy = if_else(happy == 'pretty happy',
                     2, nhappy),
    nhappy = if_else(happy == 'very happy',
                     3, nhappy)
  )
happy$nhappy

# 3
# happy$happy
# levels(happy$happy)
happy$nhappy <- as.numeric(happy$happy)
mean(happy$nhappy, na.rm = TRUE)

happy %>% 
  ggplot(
    aes(x = happy)
  ) +
  geom_bar()

happy %>% 
  group_by(year) %>% 
  summarise(
    mean_happy = mean(nhappy, na.rm = TRUE)
  ) %>% 
  ggplot(aes(x = year, y = mean_happy)) +
  geom_line()

happy %>% 
  group_by(year, sex) %>% 
  summarise(
    mean_happy = mean(nhappy, na.rm = TRUE)
  ) %>% 
  ggplot(aes( x = year, y = mean_happy,
              color = sex)) +
  geom_line()

happy %>% 
  group_by(age, sex) %>% 
  summarise(
    mean_happy = mean(nhappy, na.rm = TRUE)
  ) %>% 
  drop_na() %>% 
  ggplot(aes( x = age, y = mean_happy,
              color = sex)) +
  geom_line()

happy %>% 
  group_by(partyid) %>% 
  summarise(
    mean_happy = mean(nhappy, na.rm = TRUE)
  ) %>% 
  ggplot(
    aes(x = partyid,
        y = mean_happy)
  ) +
  geom_col() +
  coord_flip()
  

happy %>% 
  group_by(finrela) %>% 
  summarise(
    mean_happy = mean(nhappy, na.rm = TRUE)
  )

happy %>% 
  group_by(finrela, sex) %>% 
  summarise(
    mean_happy = mean(nhappy, na.rm = TRUE)
  ) %>% 
  ggplot(
    aes( x = finrela, 
         y = mean_happy,
         fill = sex)
  ) +
  geom_col(position = "dodge") +
  coord_flip()

happy %>% 
  group_by(finrela) %>% 
  summarise(
    num_obs = n()
  )

happy %>% 
  group_by(finrela) %>% 
  tally()

happy %>% 
  count(finrela)

happy %>% 
  group_by(finrela) %>% 
  ungroup()















