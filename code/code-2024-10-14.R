library(classdata)
library(tidyverse)
data(french_fries, package="reshape2")
View(french_fries)

ffm <- french_fries %>% 
  pivot_longer(cols = potato:painty, 
               names_to = "scale", 
               values_to = "score")
ffm %>% 
  ggplot(
    aes(x = scale,
        y = score,
        color = treatment)
  ) +
  geom_boxplot()

av <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/avengers/avengers.csv", stringsAsFactors = FALSE)

av %>% 
  select(
    Name.Alias,
    starts_with("Death")
  ) %>% 
  head()

deaths <- av %>% 
  pivot_longer(
    starts_with("Death"),
    names_to = "Time",
    values_to = "Died"
  ) %>% 
  select(
    URL, Name.Alias,
    Time, Died
  )

table(deaths$Died)
deaths %>% count(Died)

ffm %>% 
  pivot_wider(
    names_from = rep, values_from = score
    ) %>% 
  View()

ffm %>% 
  pivot_wider(
    names_from = treatment, values_from = score,
    names_prefix = "treatment_",
  ) %>% 
  View()

ffm %>% 
  pivot_wider(
    names_from = rep, values_from = score,
    names_prefix = "rep_"
  ) %>% 
  ggplot(
    aes(x = rep_1,
        y = rep_2)
  ) +
  geom_point() +
  facet_wrap(~scale) +
  geom_abline(colour = "grey50")


ffm %>% 
  pivot_wider(
    names_from = time,
    values_from = score
  ) %>% 
  ggplot(
    aes(x = `1`, y = `10`,
        color = subject,
        shape = factor(rep))
  ) +
  geom_point() +
  facet_grid(treatment ~ scale)+
  geom_abline(colour = "grey50")
  

  

































