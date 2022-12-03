library(ggplot2)
library(tidyverse)
p1 <- mpg %>% filter(year == 2008) %>%
  ggplot(aes(x = cty, y = hwy, colour = factor(cyl))) +
  geom_point(size=15)
p1 + scale_colour_continuous()

p1
p1 + scale_color_gradient(high="#ff0000", low="#ffff00")
p1 + scale_color_gradient2(midpoint = 17)
median(mpg$cty)
p1 + scale_color_gradientn(colors=c("white", "pink", "purple", "darkblue"))
p1 + scale_color_viridis_c()


p1 + scale_colour_brewer(palette="GnBu")

p1 + scale_colour_brewer(palette="GnBu") +
  theme_dark()


p1 + scale_colour_brewer(palette="GnBu") +
  theme_bw()

p1 + scale_colour_brewer(palette="GnBu") +
  theme_bw()

#install.packages("ggthemes")
library(ggthemes)
p1 + theme_void()
p1 + ggthemes::theme_excel()
p1 + ggthemes::theme_excel_new()

p1 + ggthemes::theme_fivethirtyeight()


####################
# customizing your reports

library(knitr)
# all possible ways to modify a code chunk:
opts_chunk$get() 

# important ones:
fig.width 
fig.height # figure with and height
fig.cap # figure caption
#
echo # show R code from this chunk?
warning # show warnings for this chunk?
message # show message for this chunk?