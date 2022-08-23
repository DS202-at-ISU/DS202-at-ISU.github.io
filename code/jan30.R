library(ggplot2) # not found? run install.packages("ggplot2")
library(classdata) 

ggplot(data=fbiwide, aes(x = Year, y = Murder)) +
  geom_point()

ggplot(data=fbiwide, aes(x = Year, y = Murder)) +
  geom_point() + facet_wrap(~State)

ggplot(data=fbiwide, aes(x = Year, 
                         y = Motor.vehicle.theft)) +
  geom_point() + facet_wrap(~State)

ggplot(data=fbiwide, aes(x = Year, 
                         y = log10(Motor.vehicle.theft))) +
  geom_point() + facet_wrap(~State)

ggplot(data=fbiwide, aes(x = Year, 
                         y = Motor.vehicle.theft/1000)) +
  geom_point() + facet_wrap(~State, scales="free_y")


ggplot(data=fbi, aes(y = log10(Count), x = Type)) +
  geom_boxplot() + coord_flip()

ggplot(data=fbiwide, aes(y = Robbery/Population*70000,
                         x = State)) +
  geom_boxplot() + coord_flip()

ggplot(data=fbiwide, aes(x = Robbery)) +
  geom_histogram(binwidth=5000)
  
ggplot(data=fbiwide, aes(x = Robbery)) +
  geom_histogram(binwidth=1000)

ggplot(data=na.omit(fbi), aes(x = Type)) + 
  geom_bar()
ggplot(data=na.omit(fbi), aes(x = Type, weight=Count)) + 
  geom_bar()
