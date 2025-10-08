library(classdata)
happy$nhappy <- as.numeric(happy$happy)

data(french_fries, package = "reshape2")
french_fries |> head()
french_fries |> View()

ffm <- french_fries %>% 
  pivot_longer(cols = potato:painty, 
               names_to = "scale", 
               values_to = "score")
ffm |> View()

df1 <- data.frame(
  name = c("John Smith", "Jane Doe", "Mary Johnson"),
  treatmenta = c(NA, 4, 6),
  treatmentb = c(18, 1, 7)
)

df1 |> 
  pivot_longer(
    cols = treatmenta:treatmentb,
    names_to = "treatment",
    values_to = "measurements",
    names_prefix = "treatment"
  )

df2 <- data.frame(
  treatment = c("a", "b"),
  John.Smith = c(NA, 18),
  Jane.Doe = c(4, 1),
  Mary.Johnson = c(6, 7)
)
df2 |> 
  pivot_longer(
    cols = John.Smith:Mary.Johnson,
    names_to = "patient",
    values_to = "measurements"
  )

av <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/avengers/avengers.csv", stringsAsFactors = FALSE)
av |> 
  select(
    Name.Alias,
    starts_with("Death")
  ) 

deaths <- av |> 
  select(
    URL,
    Name.Alias,
    starts_with("Death")
  ) |> 
  pivot_longer(
    Death1:Death5,
    names_to = "Time",
    values_to = "Died"
  )
av |> 
  select(
    URL,
    Name.Alias,
    starts_with("Death")
  ) |> 
  pivot_longer(
    Death1:Death5,
    names_to = "Time",
    values_to = "Died"
  ) -> 
  deaths

deaths |> 
  count(Died)
deaths$URL |> 
  unique() |> 
  length()
89 / 173

ffm |> 
  pivot_wider(
    names_from = time,
    values_from = score,
    names_prefix = "time_"
  ) |>
  ggplot(aes(x = time_1, 
             y = time_10,
             color = subject,
             shape = factor(rep))) +
  geom_point() +
  facet_grid(scale ~ treatment) +
  geom_abline(colour = "grey50")

fbiwide |> 
  pivot_longer(
    cols = homicide:arson,
    names_to = "Type",
    values_to = "Incidences"
  ) |> 
  mutate(
    rate = Incidences / population * 1000
  ) |> 
  filter(
    state %in% c("Iowa", "Minnesota")
  ) |> 
  select(
    state_abbr, year, Type, rate
  ) |> 
  arrange(
    year, Type
  ) |> 
  select(
    year, Type, state_abbr, rate
  ) |> 
  pivot_wider(
    names_from = c("state_abbr"),
    values_from = "rate"
  ) |> 
  ggplot(aes(x = IA, y = MN,
             color = Type)) +
  geom_point() + 
  geom_abline()
  
  
  
  
  
  
  
  



