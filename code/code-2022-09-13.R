library(classdata)
?fbi

head(fbi)
tail(fbi)
dim(fbi)

summary(fbi)
str(fbi)

fbi$population  # this is an object too!

summary(fbi$population)
str(fbi$population)

head(fbi$count, 10)
fbi$count[1:10]

mean(fbi$count)
mean(fbi$count, na.rm = TRUE)

sd(fbi$count, na.rm = TRUE)

head(fbiwide)

library(ggplot2)
ggplot(data = fbiwide, aes(x = population, y = larceny, color = year)) +
  geom_point()

ggplot(data = fbiwide, aes(x = log10(population), 
                           y = log10(larceny), color = year)) +
  geom_point()


ggplot(data = fbiwide, aes(x = log10(population), 
                           y = log10(larceny), color = state)) +
  geom_point()

library(plotly)
ggplotly()
