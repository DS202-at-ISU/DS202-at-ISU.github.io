av <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/avengers/avengers.csv", stringsAsFactors = FALSE)
names(av)

# Your turn

# Use the select function and the selector starts_with 
# (read up on ?starts_with) to select the name of the Avenger 
# and all five death variables. Inspect the result with head.

av %>% select(Name.Alias, starts_with("Death")) %>% head()


# Create a long form of the five death variables in the av 
# data set using the function pivot_longer. Call the names Time 
# and the values Died. Select URL, Name.Alias, Time, and Died, 
# and save the result as deaths. Inspect the data set.

deaths <- av %>% pivot_longer(cols = starts_with("Death"), 
                    names_to = "Time",
                    values_to = "Died") %>%
  select(URL, Name.Alias, Time, Died)

head(deaths)

# Create a (temporary) frequency breakdown of the variable Died. 
# How can we interpret these numbers?

deaths %>% group_by(Died) %>% tally()

#####
# french fries data
data(french_fries, package="reshape2")

ffm <- french_fries %>% 
  pivot_longer(cols = potato:painty, 
               names_to = "scale", 
               values_to = "score")
ffm_rep <- ffm %>% pivot_wider(
  names_from="rep", values_from="score", names_prefix = "rep"
)

ffm_rep %>% 
  ggplot(aes(x = rep1, y=rep2)) + 
  geom_point()


ffm_rep %>% 
  ggplot(aes(x = rep1, y=rep2)) + 
  geom_point() +
  facet_wrap(~scale)

# Use pivot_wider from the tidyr package to get a format in which you can 
# directly compare values from week 1 to week 10. Plot a scatterplot of values
# in week 1 against week 10. 
# Facet by treatment and scale, color by individuals and use different 
# shapes for the replicates. Is there a pattern visible?

ffm_week <- ffm %>% pivot_wider(
  names_from="time", values_from="score", names_prefix = "week"
)
head(ffm_week)

ffm_week %>% 
  ggplot(aes(x = week1, y = week10)) +
  geom_point() +
  facet_grid(treatment~scale)
