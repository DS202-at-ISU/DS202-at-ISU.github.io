library(classdata)
library(ggplot2)

str(fbiwide)
View(fbiwide)

ggplot(
  data = fbiwide,
  mapping = aes(x = homicide, y = burglary)
) +
  geom_point()

ggplot(
  data = fbiwide,
  mapping = aes(x = homicide, y = arson)
) + 
  geom_point()

ggplot(
  data = fbiwide,
  mapping = aes(x = homicide, y = arson)
) + 
  geom_point() +
  geom_line()

ggplot(
  fbiwide, 
  aes(x = log(burglary), y = log(homicide))
) +
  geom_point()





