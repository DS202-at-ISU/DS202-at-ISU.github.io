library(tidyverse)

data(french_fries, package="reshape2")
str(french_fries)
View(french_fries)

# pivot_longer
df1 <- data.frame(
  treatment = c('a', 'b'),
  John.Smith = c(NA, 18),
  Jane.Doe = c(4, 1),
  Mary.Johnson = c(6, 7)
)
df1 %>% pivot_longer(
  John.Smith:Mary.Johnson,
  names_to = "patient",
  values_to = "score"
)

# your turn
av <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/avengers/avengers.csv", stringsAsFactors = FALSE)
View(av)

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
    URL, Name.Alias, Time, Died
  )
head(deaths)
View(deaths)

deaths %>% count(Died)
deaths %>% group_by(Died) %>% tally()
deaths %>% group_by(Died) %>% summarise(n = n())
table(deaths$Died)

# pivot_wider
data <- data.frame(
  treatment = c("a", "b", "a", "b", "a", "b"),
  patient = c("John Smith", "John Smith", "Jane Doe", "Jane Doe", "Mary Johnson", "Mary Johnson"),
  score = c(NA, 18, 4, 1, 6, 7)
)

data %>% 
  pivot_wider(
    names_from = patient, 
    values_from = score
  ) %>% View()

data %>% 
  pivot_wider(
    names_from = treatment, 
    values_from = score,
    names_prefix = "treatment_"
  ) %>% View()

# your turn
french_fries %>% 
  pivot_longer(
    potato:painty,
    names_to = "scale",
    values_to = "score"
  ) %>% 
  pivot_wider(
    names_from = "time",
    values_from = "score"
  ) %>% 
  ggplot(aes(x = `1`, y = `10`,
             color = subject,
             shape = factor(rep))) +
  geom_point() +
  facet_grid(treatment ~ scale)

# fbiwide
library(classdata)
fbilong <- fbiwide %>% 
  pivot_longer(
    homicide:arson,
    names_to = "Type",
    values_to = "Incidences"
  ) %>% 
  mutate(
    rate = Incidences / population * 100000
  )

fbilong %>% 
  filter(state_abbr %in% c("IA", "MN")) %>% 
  select(state, year, Type, rate) %>% 
  pivot_wider(
    names_from = state,
    values_from = rate
  ) %>% 
  ggplot(aes(x = Iowa, y = Minnesota,
             color = Type)) +
  geom_point() +
  geom_abline() +
  facet_wrap(~Type,
             scales = "free")

fbilong %>% 
  filter(state_abbr %in% c("IA", "MN")) %>% 
  select(state, rate) %>%
  pivot_wider(
    names_from = state,
    values_from = rate
  ) -> tt

#
data$unique_id <- 1:6
data %>%
  select(-unique_id) %>% 
  pivot_wider(
    names_from = treatment,
    values_from = score
  )
