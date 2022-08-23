# devtools::install_github("heike/classdata")
library(classdata)
data("happy", package="classdata")

library(tidyverse)

money <- happy %>% group_by(finrela, sex) %>%
  summarise(
    m.happy = mean(as.numeric(happy), na.rm=TRUE)
  )

money %>% ggplot(aes(x=m.happy, y = finrela,
                     colour = sex)) +
  geom_point() +
  theme(legend.position="bottom")


happy %>% group_by(sex) %>%
  summarise(
    n = n(),
    weights = sum(wtssall)
  )

data(fbi, package="classdata")
fbi <- fbi %>% mutate(
  Rate = Count/Population*70000,
  Type = reorder(Type, Rate, median, na.rm=TRUE)
)
levels(fbi$Type)

fbi %>% ggplot(aes(x = Type, y=Rate)) + 
  geom_boxplot()

fbi <- fbi %>% group_by(Type, Year) %>% 
  mutate(
    best = rank(Rate, na.last = TRUE)
)

fbi %>% filter(best <= 3 ) %>% 
  ggplot(aes(x = Abb)) + 
  geom_bar(aes(fill=factor(best))) +
  facet_grid(Type~., scales="free", space="free") +
  coord_flip() +
  theme(legend.position="bottom")


