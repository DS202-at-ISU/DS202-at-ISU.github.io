library(tidyverse)

# load the french fries data
data(french_fries, package="reshape2")
head(french_fries)

# load avengers data
av <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/avengers/avengers.csv", stringsAsFactors = FALSE)

# select with `starts_with`
av %>% select(
  Name.Alias,
  starts_with("Death")
) %>% head()

# example of pivot_longer
deaths <- av %>% select(
  URL, 
  Name.Alias,
  starts_with("Death")
) %>% pivot_longer(
  cols = Death1:Death5,
  names_to = "Time",
  values_to = "Died"
)

# frequency breakdown
deaths
table(deaths$Died)
deaths %>% count(Died)
deaths %>% group_by(Died) %>% summarise(n = n())

deaths %>% count(Time, Died)

# pivot_longer example on french_fires data
ffm <- french_fries %>% 
  pivot_longer(
    cols = potato:painty,
    names_to = "scale",
    values_to = "score"
  )

# example of pivot_wider: compare potato with buttery
ffm %>% pivot_wider(
  names_from = scale,
  values_from = score
) %>% ggplot(aes(x = potato, y = buttery)) +
  geom_point()

ffm %>% pivot_wider(
  names_from = rep,
  values_from = score
) %>% ggplot(aes(x = `1`, y = `2`)) +
  geom_point() +
  facet_wrap(~scale)

ffm %>% pivot_wider(
  names_from = time,
  values_from = score
) %>% ggplot(aes(
  x = `1`,
  y = `10`,
  color = subject,
  shape = factor(rep)
)) +
  geom_point() +
  facet_grid(treatment ~ scale)






