library(tidyverse)

data(nasa, package="GGally")
nasa %>% ggplot(aes(x =x , y = y)) + geom_point()

str(nasa$date)
summary(nasa$date)
class(nasa$date)

nasa %>% filter(x == 1, y == 1) %>%
  ggplot(aes(x = date, y = temperature)) + 
  geom_line()

nasa %>% filter(x == 1, y %in% c(1, 10)) %>%
  ggplot(aes(x = date, 
             y = temperature, 
             group=id)) + 
  geom_line()

nasa %>% filter(x == 1, y %in% c(1, 10)) %>%
  ggplot(aes(x = date, 
             y = temperature, 
             group = id)) + 
  geom_line()
# nasa %>% filter(x == 1, y %in% c(1, 10)) %>% 
#   View()
nasa %>% filter(x == 1, y %in% c(1, 10)) %>%
  ggplot(aes(x = date, 
             y = temperature, 
             color = factor(year),
             group = id)) + 
  geom_line()


nasa %>% 
  filter(x == 1, y == 1) %>% 
  ggplot(aes(x = date, y = ozone)) +
  geom_line()

nasa %>% 
  filter(x == 1, y == 1) %>% 
  ggplot(aes(x = month, y = ozone,
             color = factor(year))) +
  geom_line()

nasa %>% 
  filter(x == 1, y == 1) %>% 
  ggplot(aes(x = month, y = ozone,
             color = year)) +
  geom_line()

nasa %>% 
  filter(x %in% 1:10,
         y %in% 7:10) %>% 
  ggplot(aes(x = date, y = temperature,
             group = id,
             color = factor(y))) +
  geom_line()

nasa %>% filter(id=="1-1") %>%
  ggplot(aes(x = date, y= temperature)) + 
  geom_point() +
  geom_line(color = 'red')

nasa %>% filter(id=="1-1") %>%
  ggplot(aes(x = date, y= temperature)) + 
  geom_line(color = 'red') +
  geom_point()
  
nasa %>% filter(id=="1-1") %>%
  ggplot(aes(x = date, y= temperature)) + 
  geom_point() +
  geom_line() +
  geom_smooth(method="lm", se=FALSE) +
  geom_text(aes(label = time,
                x = date + weeks(8)),
            data = nasa %>% 
              filter(id == "1-1",
                     temperature > 298))

nasa %>% filter(id=="1-1") %>%
  ggplot(aes(x = time, y= temperature)) + 
  geom_point() +
  geom_line() +
  geom_text(aes(label=time), color = 'red',  
            data=nasa %>% 
              filter(id=="1-1", time==50))

nasa %>% filter(id=="1-1") %>%
  ggplot(aes(x = time, y= temperature)) + 
  geom_point() +
  geom_line() +
  geom_text(aes(label=time), color = 'red',  
            data=nasa %>% 
              filter(id=="1-1", 
                     time %in% c(50, 72)))

nasa %>% filter(id=="1-1") %>%
  ggplot(aes(x = time, y= temperature)) + 
  geom_point() +
  geom_line() +
  geom_text(aes(label=time,
                color = factor(time)),
            data=nasa %>% 
              filter(id=="1-1", 
                     time %in% c(50, 72)))

nasa %>% filter(id=="1-1") %>%
  ggplot(aes(x = time, y= temperature)) + 
  geom_point() +
  geom_line() +
  geom_text(aes(label=id, colour=id),  
            data=nasa %>%
              filter(id=="1-1", time==50))

nasa %>% filter(id=="1-1") %>%
  ggplot(aes(x = time, y= temperature,
             colour=id)) + 
  geom_point() +
  geom_line() +
  geom_text(aes(label=id),  
            data=nasa %>%
              filter(id=="1-1", time==50))


