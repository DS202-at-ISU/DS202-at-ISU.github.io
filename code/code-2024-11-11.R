data(nasa, package="GGally")
library(tidyverse)

head(nasa)
View(nasa)

nasa %>% ggplot(aes(x =x , y = y)) + geom_point()
str(nasa$date)
class(nasa$date)
summary(nasa$date)

nasa %>% 
  filter(x == 1, y == 1) %>%
  ggplot(aes(x = date, y = temperature)) + 
  geom_line()

nasa %>% 
  filter(x == 1, y %in% c(1, 10)) %>%
  ggplot(aes(x = date, y = temperature, 
             group=id)) + 
  geom_line()

nasa %>% 
  filter(x == 1, y %in% c(1, 10)) %>%
  ggplot(aes(x = date, y = temperature, 
             color=id)) + 
  geom_line()

nasa %>% 
  filter(x == 1, y %in% c(1, 10)) %>%
  ggplot(aes(x = date, y = temperature, 
             group = id)) + 
  geom_line()

nasa %>% 
  filter(x == 1, y == 1) %>% 
  ggplot(aes(x = date, y = ozone)) +
  geom_line()

nasa %>% 
  filter(x == 1, y == 1) %>% 
  ggplot(aes(x = month, y = ozone,
             color = year, 
             group = year)) +
  geom_line()

nasa %>% 
  filter(x %in% 1:10, y %in% 7:10) %>% 
  ggplot(aes(x = month, y = temperature,
             group = interaction(id, year),
             color = year)) +
  geom_line()

nasa %>% filter(id=="1-1") %>%
  ggplot(aes(x = date, y= temperature)) + 
  geom_point() +
  geom_line() +
  geom_smooth(method="lm", se=FALSE)

nasa %>% filter(id=="1-1") %>%
  ggplot(aes(x = date, y= temperature)) + geom_point() +
  geom_line() +
  geom_smooth(method="lm", se=FALSE) +
  geom_text(aes(label = time, x = date+weeks(8)))

nasa %>% filter(id=="1-1") %>%
  ggplot(aes(x = date, y= temperature)) + geom_point() +
  geom_line() +
  geom_smooth(method="lm", se=FALSE) +
  geom_text(aes(label = time, x = date+weeks(4)),
            data = nasa %>% filter(id=="1-1", temperature > 298))

nasa %>% filter(id=="1-1") %>%
  ggplot(aes(x = time, y= temperature)) + geom_point() +
  geom_line() +
  geom_text(aes(label=id, colour=id),  
            data=nasa %>% filter(id=="1-1", time==50))




