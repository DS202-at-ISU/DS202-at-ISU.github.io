library(tidyverse)
data(french_fries, package="reshape2")

head(french_fries)
View(french_fries)

french_fries |> 
  pivot_longer(
    potato:painty,
    names_to = "scale",
    values_to = "score"
  ) |> 
  View()

df1 <- data.frame(
  name = c("John Smith", "Jane Doe", "Mary Johnson"),
  treatmenta = c(NA, 4, 6),
  treatmentb = c(18, 1, 7)
)

df1 |> 
  pivot_longer(
    treatmenta:treatmentb,
    names_to = "treatment",
    names_prefix = "treatment",
    values_to = "score"
  )

df2 <- data.frame(
  treatment = c("a", "b"),
  John.Smith = c(NA, 18),
  Jane.Doe = c(4, 1),
  Mary.Johnson = c(6, 7)
)

df2 |> 
  pivot_longer(
    John.Smith:Mary.Johnson,
    names_to = "patient",
    values_to = "score"
  )


av <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/avengers/avengers.csv", stringsAsFactors = FALSE)

av |> 
  select(
    Name.Alias, starts_with("Death")
  ) |> 
  head()

deaths <- av |> 
  pivot_longer(
    # starts_with("Death"),
    c(Death1, Death2, Death3, Death4, Death5),
    names_to = "Time",
    values_to = "Died"
  ) |> 
  select(
    URL, Name.Alias, Time, Died
  )

deaths |> 
  count(Died)

deaths |> 
  group_by(Died) |> 
  tally()

deaths |> 
  group_by(Died) |> 
  summarise(
    n = n()
  )

ffm <- french_fries |> 
  pivot_longer(
    potato:painty,
    names_to = "scale",
    values_to = "score"
  )

ffm |> 
  pivot_wider(
    names_from = rep,
    values_from = score
  ) |> 
  View()


ffm |> 
  pivot_wider(
    names_from = treatment,
    values_from = score
  ) |> 
  View()

ffm |> 
  pivot_wider(
    names_from = time,
    values_from = score
  ) |> 
  ggplot(aes(x = `1`, y = `10`,
             color = subject,
             shape = factor(rep))) +
  geom_point() +
  facet_grid(treatment ~ scale)

library(classdata)
View(fbiwide)

fbilong <- fbiwide |> 
  pivot_longer(
    homicide:arson,
    names_to = "Type",
    values_to = "Incidences"
  ) |> 
  mutate(
    rate = Incidences / population * 100000
  )
View(fbilong)

fbilong |> 
  select(state, year, Type, rate) |> 
  filter(state %in% c("Iowa", "Minnesota")) |> 
  pivot_wider(
    names_from = state,
    values_from = rate
  ) |> 
  ggplot(aes(x = Iowa, y = Minnesota,
             color = Type)) +
  geom_point()

fbilong |> 
  select(state, year, Type, rate) |> 
  filter(state %in% c("Iowa", "Minnesota")) |> 
  pivot_wider(
    names_from = state,
    values_from = rate
  )
  # ggplot(aes(x = Iowa, y = Minnesota,
  #            color = Type)) +
  # geom_point()
maxdeaths <- deaths |> 
  mutate(
    Time = parse_number(Time)
  ) |> 
  group_by(URL, Died) |> 
  summarise(
    max_number_death = max(Time)
  ) |> 
  filter(Died != "")

maxdeaths |> 
  ungroup() |> 
  count(max_number_death, Died)

maxdeaths |> 
  group_by(max_number_death, Died) |> 
  tally()

url <- "https://github.com/ds202-at-ISU/materials/blob/master/03_tidyverse/data/ames-liquor.rds?raw=TRUE"
# download.file(url, "ames-liquor.rds", mode="wb")
ames <- readRDS("data/ames-liquor.rds")

df_ames <- head(ames, 10)
parse_number(df_ames$`Store Location`)

df_ames <- df_ames |> 
  separate(
    `Store Location`,
    into = c("prefix", "long", "lat"),
    sep = " "
  ) |> 
  mutate(
    long = parse_number(long),
    lat = parse_number(lat)
  )

sum(ames$`Sale (Dollars)`, na.rm = TRUE)
max(ames$`Sale (Dollars)`, na.rm = TRUE)
max(ames$`Volume Sold (Gallons)`, na.rm = TRUE)

df_ames |> 
  ggplot(aes(x = long, y = lat)) +
  geom_point()


ames <- ames |> 
  separate(
    `Store Location`,
    into = c("prefix", "long", "lat"),
    sep = " "
  ) |> 
  mutate(
    long = parse_number(long),
    lat = parse_number(lat)
  )
ames |> 
  ggplot(aes(x = long, y = lat)) +
  geom_point(alpha = 0.2)
















