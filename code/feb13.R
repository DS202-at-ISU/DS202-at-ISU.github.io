library(classdata)
library(ggplot2)

ggplot(data=Titanic, 
       aes(x = Sex)) + geom_bar()
ggplot(data=Titanic, 
       aes(x = Sex, fill= Survived)) + 
  geom_bar()

ggplot(data=Titanic, 
       aes(x = Sex, fill= Survived)) + 
  geom_bar(position="fill") +
  ylab("Ratio, Hadley, it's a ratio")

ggplot(data=Titanic, 
       aes(x = Sex, fill= Survived)) + 
  geom_bar(position="stack")

ggplot(data=Titanic, 
       aes(x = Sex, fill= Survived)) + 
  geom_bar(position="dodge")

ggplot(data=Titanic, 
       aes(x = Sex, fill= Survived)) + 
  geom_bar(position="fill") +
  facet_grid(.~Age)
ggplot(data=Titanic, 
       aes(x = Sex, fill= Survived)) + 
  geom_bar(position="fill") +
  facet_grid(.~Age+Class)
ggplot(data=Titanic, 
       aes(x = Sex, fill= Survived)) + 
  geom_bar(position="stack") +
  facet_grid(.~Age+Class)

ggplot(data=Titanic, 
       aes(x = Class, fill= Survived)) + 
  geom_bar(position="stack") +
  facet_grid(.~Age+Sex)
ggplot(data=Titanic, 
       aes(x = Class, fill= Survived)) + 
  geom_bar(position="fill") +
  facet_grid(.~Age+Sex)

library(tidyverse)
ggplot(data = fbi, aes(x = Year))

fbi %>% 
#  filter(State=="California") %>%
  filter(Type=="Robbery") %>%
  ggplot(aes(x=Year, Count)) + 
  geom_point()

