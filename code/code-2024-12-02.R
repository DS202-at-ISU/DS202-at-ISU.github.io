library(tidyverse)

p1 <- mpg %>% 
  ggplot(aes(x = manufacturer)) +
  geom_bar()

p1 + theme_bw()
p1 + theme_dark()

p2 <- mpg %>% 
  ggplot(aes(x = cty, y = hwy))
p2 + geom_point()
p2 + geom_line(aes(group = cyl))




