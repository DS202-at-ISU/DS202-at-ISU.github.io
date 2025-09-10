library(ggplot2)
library(classdata)

str(fbiwide)
View(fbiwide)

# burglary vs homicide
ggplot(fbiwide, aes(x = burglary, 
                    y = homicide)) +
  geom_point()

# burglary vs homicide
ggplot(fbiwide, aes(x = log(burglary), 
                    y = homicide)) +
  geom_point()

# burglary vs homicide
ggplot(fbiwide, aes(x = burglary + 100, 
                    y = homicide)) +
  geom_point()

# burglary vs homicide with color for state
ggplot(fbiwide, aes(x = burglary + 100, 
                    y = homicide,
                    color = state_abbr)) +
  geom_point() +
  theme(legend.position = "none")

# burglary vs homicide with color for state
ggplot(fbiwide, aes(x = burglary + 100, 
                    y = homicide,
                    color = state_abbr,
                    size = population,
                    shape = state_abbr)) +
  geom_point(alpha = 0.2) +
  theme(legend.position = "none")


